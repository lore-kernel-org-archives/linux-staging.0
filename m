Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434679CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:03:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cn12so41616304edb.4
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679951001; x=1682543001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtIG2xIOByplMnWqws/0mvUBLuQ/qpbAME2bjfonzr4=;
        b=XSgeDbWO64zzzTWA5jpAhIvsNrcP9pvd1oXovn7RPKk0naVZfF+fqxA/J3+nbcNB0t
         Is3PTlNaVrEjWQZze8oAiBBoWxenWFfliTKLFRPQQYsQUho0YnvTZQOqQ/RSKUaipiuo
         Bczo7sgOoxWOZEhJMK1uWbII95FmJeaBecr3eRxx2KeecIjtEYo8Vh7kzDJT4KQ6mBov
         cUN+lSQF+x4kMlCZIca59HzVGxlyT6QjqTZQszDbtOvEcTAR5cYSMP1BdlFg8v/36s5x
         4uUi6PiU0lxZu2/XqwQuQItYcUc6C06pH7A4ziZ5t+4+nGSrAYeSuwWz2PgwfNw9nG+n
         Nz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679951001; x=1682543001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtIG2xIOByplMnWqws/0mvUBLuQ/qpbAME2bjfonzr4=;
        b=FFJDA1IT7sVqKrZzql8xFs+4a4XJbtiWJ7O2PD7SRUHOs4F+NFYyiJ6TEgs90Mx6Qg
         Ps5SAJH+N7N8AeYgFjAYFIDRbPW3/Seb1dJ2xkJD5ws6lBsMCB9Qm+wyDUPW0UPo2ejy
         vLhoFPvQv7e6Pv+qjN6QKKxj9GC8ZPgmtfWqJZ0F6zZRS8Yow2V0X7hlGPw9qoNaxCeG
         9tgfDtPXZ+lKq2Lw1CqzAb9BRnXgNh1MWSw6Y4CCe3gzO20CUohKSZjGA3xS1mzGvG4d
         Fvnzw1urrQj8kTXdJaBhQPxjVdnqNRxhuSuDgh55oGkNX9iiHmasWA+q28JYr7k3z5Xu
         rkeQ==
X-Gm-Message-State: AAQBX9ccMqQ7u1SH4R867IaLFHPRQIkZJGjhuC997xFlueFei0xD/Efs
	AODWjvu2Is4wo9UPRwUQlwo=
X-Google-Smtp-Source: AKy350azLVFQA+ldnfv1H9+tJT/ffPgd2H+4RbeKa9lH8FycSHOZzQVxWiGwsOZH/iVX/DEKi8GtUg==
X-Received: by 2002:a17:906:7490:b0:933:fa42:7e36 with SMTP id e16-20020a170906749000b00933fa427e36mr11690098ejl.5.1679951000955;
        Mon, 27 Mar 2023 14:03:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id i6-20020a170906250600b009306be6bed7sm14381083ejb.190.2023.03.27.14.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:03:14 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:02:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: rtl8192e: Remove wireless modes A, N_5G from
 _rtl92e_hwconfig
Message-ID: <ab96af426f090ac2fe4a2536b052fcf8a2e38aa8.1679949171.git.philipp.g.hortmann@gmail.com>
References: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679949171.git.philipp.g.hortmann@gmail.com>

Remove WIRELESS_MODE_N_5G and WIRELESS_MODE_A as those are not supported
by hardware and to improve readability. Combine WIRELESS_MODE_G with
default to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index f4fdaeff2917..1da14e737aa4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -503,16 +503,6 @@ static void _rtl92e_hwconfig(struct net_device *dev)
 		regRATR = RATE_ALL_CCK;
 		regRRSR = RATE_ALL_CCK;
 		break;
-	case WIRELESS_MODE_A:
-		regBwOpMode = BW_OPMODE_5G | BW_OPMODE_20MHZ;
-		regRATR = RATE_ALL_OFDM_AG;
-		regRRSR = RATE_ALL_OFDM_AG;
-		break;
-	case WIRELESS_MODE_G:
-		regBwOpMode = BW_OPMODE_20MHZ;
-		regRATR = RATE_ALL_CCK | RATE_ALL_OFDM_AG;
-		regRRSR = RATE_ALL_CCK | RATE_ALL_OFDM_AG;
-		break;
 	case WIRELESS_MODE_AUTO:
 	case WIRELESS_MODE_N_24G:
 		regBwOpMode = BW_OPMODE_20MHZ;
@@ -520,12 +510,7 @@ static void _rtl92e_hwconfig(struct net_device *dev)
 			  RATE_ALL_OFDM_1SS | RATE_ALL_OFDM_2SS;
 		regRRSR = RATE_ALL_CCK | RATE_ALL_OFDM_AG;
 		break;
-	case WIRELESS_MODE_N_5G:
-		regBwOpMode = BW_OPMODE_5G;
-		regRATR = RATE_ALL_OFDM_AG | RATE_ALL_OFDM_1SS |
-			  RATE_ALL_OFDM_2SS;
-		regRRSR = RATE_ALL_OFDM_AG;
-		break;
+	case WIRELESS_MODE_G:
 	default:
 		regBwOpMode = BW_OPMODE_20MHZ;
 		regRATR = RATE_ALL_CCK | RATE_ALL_OFDM_AG;
-- 
2.39.2

