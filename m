Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267E3C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:13:54 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r4so8918119edi.8
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=VP/KKkIUNQwmK/Lbxdjw2+ts47zQFWqZhW4ZLZ9vpOc=;
        b=JkD41WlYO/1YezLjNDCVBFgaskAYKk3CyHrN/I0dDy7W00OfgfLekpYiKFLhkuKmod
         D7JqaZV20QKzGyte258FcETHbgz79KxFU8YotPYL8UdTCOtE6mC4FwGMS1Cw4PY8hxpu
         DpKYWdfBxFbgJojsBM6RZ4slxncdSh9ZSOlgoHsdbzFmk+Hgw89vjZRDnVjcoARiuKL7
         dTD/GE34LQpNKUC5YSoPI/boBBbLUrug6HpkSCTT+vt1J4+zalziIRkLcSTbZyN15z3q
         o184F3sbe5bPcYpH45a5r4jnNhVJBWbVdN17h7ZYIjWTh0+h0vGXQH3rMKFp5k85zNqZ
         fCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=VP/KKkIUNQwmK/Lbxdjw2+ts47zQFWqZhW4ZLZ9vpOc=;
        b=HFC+6rLoweHmibz8pk5fv8LnUjKbLAOj0F8rEnPowwWvmC7iN6C9ay2B42DpX0NJR9
         7y1ZFw2Tq99y2PhSJfhm/NL8FzpEkM8t5cpBZsKTNvmi8pzRjaiOQ/QKLsmplhF7jTxL
         7bkPgbOhjDVjAKoFmt9Z2A8/NuOhjbGremhF9y3gC7RTWbpk+wukXNHo5HBCd1rbZBz+
         G1/V8qQYp65OnqoCzlTd0IjZfRa6aYWLmBU2R9pyB+tW52rO8zzpb3rvGeH3CYiTV1Xw
         zDZzWr9NOMIvoSn0D38tXj+SvaQtP52PE/fSTF08p/ojFGLoWm9zG4q9/vX2G12ih08u
         wAHw==
X-Gm-Message-State: ACgBeo0WsV3zrVIMdTHRa3856Bh64zoe2vFpwasT5N+/vrpOWa86nWAU
	gBI8eVqWPfz0GCSGHMO6U6QYWbLQ/Dk=
X-Google-Smtp-Source: AA6agR5NLfEBuWbhHw9Au5cYdfb0rpy5Ezpjl8QLqICxFOW3L6xzGfIiLo2RHCvjN6d2+p2CT6YC5w==
X-Received: by 2002:a05:6402:331d:b0:43d:9e2e:6966 with SMTP id e29-20020a056402331d00b0043d9e2e6966mr15470087eda.214.1659896033293;
        Sun, 07 Aug 2022 11:13:53 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709063d3200b006fee98045cdsm4115660ejf.10.2022.08.07.11.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:13:53 -0700 (PDT)
Date: Sun, 7 Aug 2022 20:13:51 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] staging: vt6655: Convert macro
 MACvEnableBarkerPreambleMd
Message-ID: <542b9f8c0b10aa3db143b22f7425ab5bddc5bffe.1659892671.git.philipp.g.hortmann@gmail.com>
References: <cover.1659892670.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659892670.git.philipp.g.hortmann@gmail.com>

Convert macro MACvEnableBarkerPreambleMd to static function which calls
the common static function vt6655_mac_set_bits. This saves
codelines and multiline macros are not liked by kernel community.
Function name is also changed to avoid CamelCase which is not accepted
by checkpatch.pl and to clean up namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Changed used function to vt6655_mac_set_bits
---
 drivers/staging/vt6655/device_main.c | 6 +++++-
 drivers/staging/vt6655/mac.h         | 8 --------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 96945fb8d536..46bd88ee4668 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -244,6 +244,10 @@ static void vt6655_mac_dis_protect_md(void __iomem *iobase)
 	vt6655_mac_clear_bits(iobase, ENCFG_PROTECTMD);
 }
 
+static void vt6655_mac_en_barker_preamble_md(void __iomem *iobase)
+{
+	vt6655_mac_set_bits(iobase, ENCFG_BARKERPREAM);
+}
 /*
  * Initialisation of MAC & BBP registers
  */
@@ -1479,7 +1483,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_PREAMBLE) {
 		if (conf->use_short_preamble) {
-			MACvEnableBarkerPreambleMd(priv->port_offset);
+			vt6655_mac_en_barker_preamble_md(priv->port_offset);
 			priv->preamble_type = true;
 		} else {
 			MACvDisableBarkerPreambleMd(priv->port_offset);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a7d6254fded0..3400ea15b673 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -543,14 +543,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvEnableBarkerPreambleMd(iobase)				\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue | ENCFG_BARKERPREAM;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvDisableBarkerPreambleMd(iobase)				\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.37.1

