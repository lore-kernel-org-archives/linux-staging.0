Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9B2568
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 21:25:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a8so36518259ejc.8
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JWjYfqXasCYEUfZcDuCmAcewGNZu47MK/PX+0VAxPLM=;
        b=Di05ReSn75HTTnV/xV+063h7YXUIJNIUfTSmixmKczxJxPu8eCzNM7Ar5HTzlO96Jp
         SHUfPWxlkV8NFxfHgfCcXNeK1D90SMct9LNxnww86f26wxK79xcRn3O7dzw+Cb9auOuh
         ITAtC9/YL8h0B8Rmm4hps6ExwAonjLs70UKGruWcvLxTI+5inrcmTFC5AVbtQQsgxrfF
         hf0GdAaT861gDX9hHQp32FoVqqoJOWwpaS21I79pT8nW3cfYylqBuA+x1ZpYg0pvg7oK
         ZqKbH6qCjMnl7zTxQ+bkiGTLN3ynNadoAGGfHrJeSkxluHQAQoZ3dLFxlxbkBlB1R/G2
         ORag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JWjYfqXasCYEUfZcDuCmAcewGNZu47MK/PX+0VAxPLM=;
        b=2GsmM2q2RrW4SFoDWxbF3S2OARPrAye5VSLx6XMdBOBzPNiPhhnEQMxeD8yD4tM+hO
         xpwDotwgHGjcUSzEelyZqsYV/yXrjXzGB/pjvjsMOsFGO5IaOQfyddkna0lM2Yb54h+2
         JkF2BuaiUGCrp7itqLynmL3dDTrdVFimis71PLWjU9tMkmsEVbLLRqpvAnVdMkw6Sq2+
         h3Hb5SEGQsX/oROyucJ6fxdsHpEWkqtXSCz4jMQOUZNnMTrOTZUtuEpwLkYVNR6esgzW
         N60LJ5hDsNFp5O/EMb1FJI5J24jUYRx2qj726sMUcjzojWgUbIMWNn7clQkvtPuKxZLM
         W/mg==
X-Gm-Message-State: AOAM532aI8qBTGLq0N6+Hobp4pXHVtEdFbE92yZAmXY7OwTPEs/SBMLy
	fmMVP7QYRy2XHJqdKxeeJr0uEl108qw=
X-Google-Smtp-Source: ABdhPJwngm1nPQDLcrGttoKbc3qyTiAwa5bkoKD1xHpoJtrVHFT/viemRNdvBvdj/rDEhH0nF8Iewg==
X-Received: by 2002:a17:906:a145:b0:6ae:e45d:15b6 with SMTP id bu5-20020a170906a14500b006aee45d15b6mr17107775ejb.714.1645478712790;
        Mon, 21 Feb 2022 13:25:12 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id m4sm5598757ejl.45.2022.02.21.13.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:25:12 -0800 (PST)
Date: Mon, 21 Feb 2022 22:25:10 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] staging: vt6656: Fix CamelCase warnings in macro
Message-ID: <53072a97348b08276b083ce18188b9199cbfaae6.1645477326.git.philipp.g.hortmann@gmail.com>
References: <cover.1645477326.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645477326.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warnings like:
- CHECK: Avoid CamelCase: <uVar>

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Devided patch into three
---
 drivers/staging/vt6656/device.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
index dda38c2a6f06..0ab2d60204e8 100644
--- a/drivers/staging/vt6656/device.h
+++ b/drivers/staging/vt6656/device.h
@@ -381,11 +381,11 @@ struct vnt_private {
 	struct ieee80211_low_level_stats low_stats;
 };
 
-#define ADD_ONE_WITH_WRAP_AROUND(uVar, uModulo) {	\
-	if ((uVar) >= ((uModulo) - 1))			\
-		(uVar) = 0;				\
+#define ADD_ONE_WITH_WRAP_AROUND(var, modulo) {	\
+	if ((var) >= ((modulo) - 1))			\
+		(var) = 0;				\
 	else						\
-		(uVar)++;				\
+		(var)++;				\
 }
 
 int vnt_init(struct vnt_private *priv);
-- 
2.25.1

