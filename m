Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201E64A09
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:21:15 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z41so12654237ede.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yRa0b2lHkl6grPBOgdI9i8N3apwm433ugj3fMKkyrCs=;
        b=fSQLvJyzlvpnzhnTI2Ak9Sv7ottO1qVYdA2ySP09FIwax4aP+tqPPa9rbbMIAioQm+
         jE+LY3fs00b53z6cAnEehmUPNJap5IchdfjkVvpMwBCgibdydF01naAS8mwdrf6DKCau
         6gwULgAW1lGUcZPIduH83HlIvcChfF9XQkAzwRRLazqzBGTo6iFpdGtCMLG0tocA4e5a
         eqs6RV/7/4qh9/4c0SkUKGs8bgiSvosZE7Cn7aDtYbqnZVnylYjqfFjQ7cRXApQ40H0A
         ocTxyZMwYIbE2zZegHpHYtdVMGdt+1Ib/3nF16q5l931DYRrmmWXsJSzOmj2uqoJtAPQ
         EUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yRa0b2lHkl6grPBOgdI9i8N3apwm433ugj3fMKkyrCs=;
        b=bI2d+7pAxdvLHx0qJHezeN6N52JjTKOmsnaMzyziRGnr3DQVdhHCeSxlTZhGLnpvhZ
         Di6zfMCIRWUYxKL611MFvAMY8OyTFKV921NGZ7sPxpZ6P0hAhHerjBCJl8OSV+Hm4c9/
         xxbFDicr0rvaFamFBpaZ2rA9shWlA3Jf7q/Al0uRyqf3eH6kqJwiXzl0FT3ZEelMyF7S
         udWF8zcKQmD/ZTM+9UslPA5PQO1dPs74/tWTq68zds7mBxHLlZ5tDhlGdqymsiNrQThu
         3nm5DNEviJv7n8wJEt0ZDkvrY2ChxYRc4hLSpvI0LpM3T0vPziErlx+wx9In3jsc4tU1
         usuw==
X-Gm-Message-State: AJIora+SYTYMkSChqWKGfcy56iJ3Y9rLEQ2RB3xCol+ks4h+GSjAjwq9
	A1vZFO36kU48gQPs6N3yWtE=
X-Google-Smtp-Source: AGRyM1uksjksaqdaQ6jjO6J9u02+r1D3WXjcJwB49/PeMgsYd32pribpvmokZbvr9Npoj4+EQdxxag==
X-Received: by 2002:aa7:cdc2:0:b0:43a:7255:5274 with SMTP id h2-20020aa7cdc2000000b0043a72555274mr1851055edw.159.1656958873537;
        Mon, 04 Jul 2022 11:21:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id pv1-20020a170907208100b00726abf9cd8esm10137393ejb.125.2022.07.04.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:21:13 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:21:08 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: vt6655: Convert macro
 vt6655_mac_read_ether_addr to function
Message-ID: <2e2524187d9d3a6140fe4a5a35926db14dddfe98.1656835310.git.philipp.g.hortmann@gmail.com>
References: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1656835310.git.philipp.g.hortmann@gmail.com>

Convert macro vt6655_mac_read_ether_addr to static function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 025a53b493d3..298963cbca1d 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -123,6 +123,7 @@ static void device_free_info(struct vnt_private *priv);
 static void device_print_info(struct vnt_private *priv);
 
 static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr);
+static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr);
 
 static int device_init_rd0_ring(struct vnt_private *priv);
 static int device_init_rd1_ring(struct vnt_private *priv);
@@ -200,17 +201,17 @@ static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
-#define vt6655_mac_read_ether_addr(iobase, mac_addr)		\
-do {								\
-	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
-	mac_addr[0] = ioread8(iobase + MAC_REG_PAR0);		\
-	mac_addr[1] = ioread8(iobase + MAC_REG_PAR0 + 1);	\
-	mac_addr[2] = ioread8(iobase + MAC_REG_PAR0 + 2);	\
-	mac_addr[3] = ioread8(iobase + MAC_REG_PAR0 + 3);	\
-	mac_addr[4] = ioread8(iobase + MAC_REG_PAR0 + 4);	\
-	mac_addr[5] = ioread8(iobase + MAC_REG_PAR0 + 5);	\
-	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
-} while (0)
+static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr)
+{
+	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
+	mac_addr[0] = ioread8(iobase + MAC_REG_PAR0);
+	mac_addr[1] = ioread8(iobase + MAC_REG_PAR0 + 1);
+	mac_addr[2] = ioread8(iobase + MAC_REG_PAR0 + 2);
+	mac_addr[3] = ioread8(iobase + MAC_REG_PAR0 + 3);
+	mac_addr[4] = ioread8(iobase + MAC_REG_PAR0 + 4);
+	mac_addr[5] = ioread8(iobase + MAC_REG_PAR0 + 5);
+	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
+}
 
 /*
  * Initialisation of MAC & BBP registers
-- 
2.36.1

