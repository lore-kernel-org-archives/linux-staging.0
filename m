Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6D72
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:01:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q21so3536062plq.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dR85NjlBnsEfD4ItpoEv8i4dv3AbkGejzFu1tFYkWZM=;
        b=J0RJbkPgWN2y0sUFHQIu0EyRwxEwsZMdtTxXejGs9Q0/ynW6rMw5jRcBbaaSOFSUhX
         WWSRZ1+vxknq7KgJSGJIphrr2T/jT3GrypuosJfJ6PLVH6bs+C9GHMyEHV+Gw0R9hvS2
         zjNJNYcvyMf0Zy6tD8bNGsqIF88ErOSFNBGYFc77ZdTAk5umG+lh/l2m6NoJbtch4wlz
         vuFGRdMXaC78lwb6Z4vJl0cfpzCswnChbcdtFiQ/5kejB2HXTcwoZgrJhz1u1Hv+bZld
         elXGRp/LmxbhLFNQDnsATzQlzMrHHh3k2mOLsz1gfmYSIqr0Gc/+gu6gvimx65c/gYKh
         mYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dR85NjlBnsEfD4ItpoEv8i4dv3AbkGejzFu1tFYkWZM=;
        b=tiDQvfqPIJaIcLXHi03yTha7IDkIInyVJgzxWsOWqLwRPW4C/cZQM9t2YmF8WoCvO0
         7UjTRqwGlWCPgNtJ22qU69SYOa0vDmTUujc/Vw56bzbU49qVb9FsuIGCEOKaRejVprE/
         WD9jj/kUg9vKXBVuudhHJgmanqt6oBnekXq7wvWO3dLsb7PFiV4RuwWJFgpfB/hG9vjE
         zaZWOsBkf7EwoBG3lXTNW8s8BVbU9u9STCE9yLFayUdeo/YVo5K2NgkOL0EQqDnL638L
         +jPXTUrEU+x7zK7MfeNEnHa2o9Xz8rB4rXVIn4uwhEvtHBWPFtV2Q/C8xWWsz3ITqm3O
         EkJw==
X-Gm-Message-State: AOAM530JOHcmMokdefVH9sKeTDmZt4NdVG1eIz2AH4Re73CzAtly2jrO
	uXoe5n5oXJmKHU8iSIwXtvc=
X-Google-Smtp-Source: ABdhPJwZOaui///0gBVP98tgaliKgTTWNx5a1vfq/JHjXXr2m8DqZdTuTPFiqj+w0BnNRy75K8TB1g==
X-Received: by 2002:a17:902:6acb:b0:132:1ce7:c829 with SMTP id i11-20020a1709026acb00b001321ce7c829mr7601592plt.68.1630054876860;
        Fri, 27 Aug 2021 02:01:16 -0700 (PDT)
Received: from localhost.localdomain ([112.17.247.23])
        by smtp.gmail.com with ESMTPSA id v7sm5478604pjk.37.2021.08.27.02.01.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Aug 2021 02:01:16 -0700 (PDT)
From: Wenlong Zhang <yixiaonn@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	insafonov@gmail.com,
	cyruscyliu@gmail.com,
	yajin@vm-kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Wenlong Zhang <yixiaonn@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: prevent ->ssid overflow in rtw_wx_set_scan()
Date: Fri, 27 Aug 2021 17:00:27 +0800
Message-Id: <20210827090027.23158-1-yixiaonn@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <YSfjtZsISLH6cktF@kroah.com>
References: <YSfjtZsISLH6cktF@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
fixed up the staging driver rtl8188eu by adding another check
to prevent writing beyond the end of the ->ssid[] array.

Resolve this by properly fixing up the rtl8723bs driver's version of
rtw_wx_set_scan()

Fixes: 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
Signed-off-by: Wenlong Zhang <yixiaonn@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 902ac8169948..6fc1020cea11 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1351,9 +1351,9 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 
 					sec_len = *(pos++); len -= 1;
 
-					if (sec_len > 0 && sec_len <= len) {
+					if (sec_len > 0 && sec_len <= len && sec_len <= 32) {
 						ssid[ssid_index].SsidLength = sec_len;
-						memcpy(ssid[ssid_index].Ssid, pos, ssid[ssid_index].SsidLength);
+						memcpy(ssid[ssid_index].Ssid, pos, sec_len);
 						/* DBG_871X("%s COMBO_SCAN with specific ssid:%s, %d\n", __func__ */
 						/* 	, ssid[ssid_index].Ssid, ssid[ssid_index].SsidLength); */
 						ssid_index++;
-- 
2.15.0

