Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840F7499
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 20:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF03C341C5;
	Tue, 21 Jun 2022 20:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655844648;
	bh=UuFhUl4vF9VERPH2Y+GiPCjf7uTaIG3fyCT8TXt7Ed4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0/DI3Ucl34oFhkYEgRtQ7yxh4UneCqPbPIThWxSnWVWGb5qTBRANBf0RVCXJfkzg
	 5Fs31YsWhIxTr7tjCtNa7t3k6sHTdrVE3Bek5uCTfF0BquOhnM9UCO90y61cWfv9CV
	 wQRrgkIc7qOTEcV/SLra6nskPvAB/2ElBFO1lc365IFL4QID/XYZw/SlxZLJZXdqzm
	 jbU8b9ufu2QOBR4DssfE2hV2O1VdRsWBhMYx6cP/vPJtzH4bwz/yp8iUj5hQqBCqf+
	 pfpFAxONDdbyrTIZnaD3GHr2cWnCo7MS1bgc9gvEDULr9X5ZajpgobBkp+W2vj+aX/
	 +42BcRLshqEJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	straube.linux@gmail.com,
	arnd@arndb.de
Subject: [PATCH AUTOSEL 5.15 03/17] staging: rtl8723bs: Allocate full pwep structure
Date: Tue, 21 Jun 2022 16:50:26 -0400
Message-Id: <20220621205041.250426-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621205041.250426-1-sashal@kernel.org>
References: <20220621205041.250426-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 67ea0a2adbf667cd6da4965fbcfd0da741035084 ]

The pwep allocation was always being allocated smaller than the true
structure size. Avoid this by always allocating the full structure.
Found with GCC 12 and -Warray-bounds:

../drivers/staging/rtl8723bs/os_dep/ioctl_linux.c: In function 'rtw_set_encryption':
../drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:591:29: warning: array subscript 'struct ndis_802_11_wep[0]' is partly outside array bounds of 'void[25]' [-Warray-bounds]
  591 |                         pwep->length = wep_total_len;
      |                             ^~

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20220608215512.1070847-1-keescook@chromium.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 295121c268bd..4ec3910d1fcf 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -104,7 +104,8 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, key_material);
-			pwep = kzalloc(wep_total_len, GFP_KERNEL);
+			/* Allocate a full structure to avoid potentially running off the end. */
+			pwep = kzalloc(sizeof(*pwep), GFP_KERNEL);
 			if (!pwep) {
 				ret = -ENOMEM;
 				goto exit;
@@ -596,7 +597,8 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, key_material);
-			pwep = kzalloc(wep_total_len, GFP_KERNEL);
+			/* Allocate a full structure to avoid potentially running off the end. */
+			pwep = kzalloc(sizeof(*pwep), GFP_KERNEL);
 			if (!pwep)
 				goto exit;
 
-- 
2.35.1

