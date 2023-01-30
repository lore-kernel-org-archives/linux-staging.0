Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBAF392
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 03:59:57 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051189;
	bh=4TcYuhkYiPYcTl4XN2YXmrkhFGdkS66np9T9wEi7jbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lZIbZghB+YeUrvikUYWNmjWCNYHReEFlwlNV024bQS1k3rDsHe/YCtREPKZYMXt9V
	 /lxqSkvox4HWH515xlrgamoVICeb9gnZPK/0ImUeyai14FB9i75OX+RD4faumH84oY
	 57MD9QZ02LRaXRKuzv1sEbkDzA4AI1T79vIlRuZg=
Date: Mon, 30 Jan 2023 03:59:41 +0000
Subject: [PATCH 5/9] HID: intel-ish-hid: Constify lowlevel HID driver
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230130-hid-const-ll-driver-v1-5-3fc282b3b1d0@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=912;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=4TcYuhkYiPYcTl4XN2YXmrkhFGdkS66np9T9wEi7jbM=;
 b=kV0xKBRaReqa5AbnRSCMJjFEIhMpKmVOUhWuR8VVc+LC8/4CZN6drRSAoPe1l003SrEEMa0Ksi6Y
 cHa9HrDpAbQQ7N5PreBO8Wq0K2G+/IuzT5hTdbvXEBto7dhZpoEh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
the lowlevel HID drivers are only exposed as const.

Take advantage of this to constify the underlying structure, too.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/intel-ish-hid/ishtp-hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.c b/drivers/hid/intel-ish-hid/ishtp-hid.c
index 14c271d7d8a9..00c6f0ebf356 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.c
@@ -183,7 +183,7 @@ void ishtp_hid_wakeup(struct hid_device *hid)
 	wake_up_interruptible(&hid_data->hid_wait);
 }
 
-static struct hid_ll_driver ishtp_hid_ll_driver = {
+static const struct hid_ll_driver ishtp_hid_ll_driver = {
 	.parse = ishtp_hid_parse,
 	.start = ishtp_hid_start,
 	.stop = ishtp_hid_stop,

-- 
2.39.1

