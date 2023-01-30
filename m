Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA05391
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 04:09:52 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051187;
	bh=ZbgbgVtlPFtq55TH0opkbq5iHNhesuWMDM9ZEPXeOsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IHtr2UuaboBduqdOMpA0Y3egWz4OZpz39J8oRqVw5iP94dUmf4mF7esWnJ84+m7BG
	 v9ZSNw7aALe7JMKpXu5UfKKC/CkAqZP0uuoIX5UMFMDfWoQXbsKtOPWkW6mwCBix+/
	 IYpZ5J2dlAz3+VJR98xDZi+ZP27wPkdLw/yy/V+k=
Date: Mon, 30 Jan 2023 03:59:40 +0000
Subject: [PATCH 4/9] HID: steam: Constify lowlevel HID driver
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230130-hid-const-ll-driver-v1-4-3fc282b3b1d0@weissschuh.net>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>, 
 Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, 
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, 
 linux-staging@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=865;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZbgbgVtlPFtq55TH0opkbq5iHNhesuWMDM9ZEPXeOsk=;
 b=K+qvlSsOYKsG6L1e28n33S7oEbVaEzdLgqVh5PfopUoHLueDoSD6fx7F81Fsg5y17jqMq6D+mxFI
 Dt3Tz0fCAsJAvZfHiHimUa8Deeuk9XNdvf/Yy+8GUczAZ45Nd/ii
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
the lowlevel HID drivers are only exposed as const.

Take advantage of this to constify the underlying structure, too.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-steam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 8ee43cb225fc..29ec8b34741a 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -674,7 +674,7 @@ static int steam_client_ll_raw_request(struct hid_device *hdev,
 			report_type, reqtype);
 }
 
-static struct hid_ll_driver steam_client_ll_driver = {
+static const struct hid_ll_driver steam_client_ll_driver = {
 	.parse = steam_client_ll_parse,
 	.start = steam_client_ll_start,
 	.stop = steam_client_ll_stop,

-- 
2.39.1

