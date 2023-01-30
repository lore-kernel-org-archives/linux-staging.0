Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE098394
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 03:59:57 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051189;
	bh=BpfSdgQmWN7q99yWHa1NYztfRxaFIEEu1ai2aAeAuso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QOokcRGe0+cEYV30EE7K9Tnus237x+2wRUdExZ68BeHv4mLeOm3rRO/IKzDmTGzkM
	 N5+cQhRULWGurL58OImk52Z/ioe1QyjTB1ObN8ZL0jiNAOXpPZ35+0hrPD7olM4umo
	 zAPhldvlVvB06EQ+hjis8ev0A3BokINldBcPeM4g=
Date: Mon, 30 Jan 2023 03:59:44 +0000
Subject: [PATCH 8/9] platform/x86: asus-tf103c-dock: Constify toprow keymap
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230130-hid-const-ll-driver-v1-8-3fc282b3b1d0@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=815;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=BpfSdgQmWN7q99yWHa1NYztfRxaFIEEu1ai2aAeAuso=;
 b=S7ImS9NhnHkKy6L+nBosZuDJHdCEwxhmiAtNrw4E79jpSJgNI9SvNJVzb/JDpH6vuWcg5dnPXhMY
 sGhjwhWsBdgV22P2TJw9zNgSknRBpwnGxVZetNJivjYgVfn1yHod
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This structure is never modified, make it const.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/asus-tf103c-dock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
index 84c45e8f51ad..aeb1138464df 100644
--- a/drivers/platform/x86/asus-tf103c-dock.c
+++ b/drivers/platform/x86/asus-tf103c-dock.c
@@ -259,7 +259,7 @@ static const struct hid_ll_driver tf103c_dock_hid_ll_driver = {
 	.raw_request = tf103c_dock_hid_raw_request,
 };
 
-static int tf103c_dock_toprow_codes[13][2] = {
+static const int tf103c_dock_toprow_codes[13][2] = {
 	/* Normal,            AltGr pressed */
 	{ KEY_POWER,          KEY_F1 },
 	{ KEY_RFKILL,         KEY_F2 },

-- 
2.39.1

