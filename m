Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D55C950
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 21:48:28 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-93abb185e13so7559266b.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 14:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680731308; x=1683323308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wb89At04Bi8wiMaKMj24IvEwgTW885oVxHw3HIZ4Q3w=;
        b=Bw6jtK5qklfy9o5CDcreSbZVT5HtivXxGQm+0wZ8DiE2RXDKk5W6xzuicOPKOnqBBL
         SRCLjTy1jl1NpzK8c0/ldtJAUnQ9iCwz5G66mKPFN/KPxnuri6vV+lam6cHaYFYFNgiK
         2p1nW36YI654ZRvK2x4dJUU2z/tOPF8V5f+ZdxtKrqdR72aS0NlmpKo5hhitBmCB0r0j
         njaQIsS2i/0uEI+0fGyF33J6cOsSQfVzSBUl8wWxADCdwKPpTwJU5BiAzN3TwUk09/Mp
         +/tMyuF0B88HwXwBBQR/I/9JjCczmcQnwZJH4OIBjbQFvuKyVTl3CBcBIYTz+JC69oHb
         rArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680731308; x=1683323308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wb89At04Bi8wiMaKMj24IvEwgTW885oVxHw3HIZ4Q3w=;
        b=PrYvr+51QxnvRTx4iawt6X98L6BAY2VCjOTfLxpDG4P7A14cxXF0GEPtTYmXmqm7bQ
         Fvdkn2M91XGVOiX20GE8jK+b3PGDmBdlwz8JlB+U4gMS0o0zr1pfB1G7EeNLE+q9KX1c
         lJQpybcDfE/cPiU8pgUEZcYvLG5Vy/jPIojIDv1QR+kiUbnyvpgW7K39lbRRRsnotf3z
         qOQxLbOq61tQ+mj4jsHCxA9NdCxogJEGN2L5e5PhE9wdmf8UGwIrc9w/EMRUz0EdHy/I
         e0FOpeeJDwgXdpg3vXB/HHjOUZZlEAP62kIIo5HEM1hh03kmiz57RMjXMzOPwJWgzUpx
         WnNw==
X-Gm-Message-State: AAQBX9dGKi9NYrANOcFgyZHWFc1jsxt/gEgUuBhAzJD0z6LwDko9flh9
	XMUP1OAY/ed7ic9la/gyPoY=
X-Google-Smtp-Source: AKy350bJ561AvTuxSKMXRcqLa+FNL2FUuCCD2f3n8tmaWku8oXRbzr3vL1FXz3q2fgEDAmzf85PLmw==
X-Received: by 2002:a17:906:2093:b0:933:2e79:4632 with SMTP id 19-20020a170906209300b009332e794632mr3098433ejq.1.1680731308443;
        Wed, 05 Apr 2023 14:48:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y1-20020a170906518100b008c76facbbf7sm7984053ejk.171.2023.04.05.14.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 14:48:27 -0700 (PDT)
Date: Wed, 5 Apr 2023 23:48:26 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] staging: rtl8192e: Remove unused variable RF_Type
Message-ID: <bb038a5ffe3208f385543d9e7b360bd7f2f05d0f.1680729716.git.philipp.g.hortmann@gmail.com>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680729715.git.philipp.g.hortmann@gmail.com>

Remove unused variable RF_Type.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7d83a4c322cf..ae7c6a5804ee 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1390,7 +1390,6 @@ struct rtllib_device {
 	size_t assocreq_ies_len, assocresp_ies_len;
 
 	bool	bForcedBgMode;
-	u8 RF_Type;
 
 	u8 hwsec_active;
 	bool is_silent_reset;
-- 
2.40.0

