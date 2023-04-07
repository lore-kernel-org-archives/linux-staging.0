Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CBAAFE7
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 21:50:45 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-94971337b10so29721866b.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680904243; x=1683496243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdeCi9ynBBJ3STbkPEllMJlg5rsYYkXlBNCjPQYQj9o=;
        b=KXb7MwaLEC/Ok7JTRQaP0KVNxzKIRgKDnJ4/fxfBHzR57E2DE2GH2C9GgP+YaS+9KJ
         s19Vri+omz4YKyGgEMHouVTE7TCNiOT+cXTVJlrIzn9hDdFGliu0Ej+mud0nCymMqUXx
         XjXolaCrrpQiF2tC/dLUbgocLnHsrD7HpougKGOdipP9iNRj4Ror1t9pYFIjIwrMhA9f
         FDN4z3c7Yf+dJ+yJmk0eve9W/WFXjWfWkStslXWIF0KnHxmvVKzOudxTP9fTM9t6xuFL
         ZHVXMDSk22QZ3Toy8q2lTnw6hfuDWjFMIWEpyc4psXsPBQZ7pjZbuM/ubCgviN7v5cST
         IPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904243; x=1683496243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdeCi9ynBBJ3STbkPEllMJlg5rsYYkXlBNCjPQYQj9o=;
        b=rgYCrpC6vl68cvx6BDu9lzmM+VTufr6c9DlkWPU2LI/J+T2MB/xqeIp9AqIwUD/ziT
         A4BoZ0CM4hS9VJmbKGdNrYpjjSInw4rAw1Xapt+rd5/mBUOSukrQeSi1afPy5v9vvUJm
         dFEtuR+U2E1jXA5U28imSvVzRqwtlex57RPaDkoHYHSWjJn5tIg1CzUazkS8O19Du05U
         4jQCgU/O5HjcTzSAeAd7c+WHgHxZwF0I54OJlZpfLKiICquOuijseXwGYi2XYWzQN2l8
         n7o9m/yYMSoA/dsYY48BOBoZKUy8HKy8Qjx4EXXFm10E71Z5FScPdNx9nutd7U/movvC
         jd3g==
X-Gm-Message-State: AAQBX9fh7x9Wxe684xo5o0rhxOF5AXUnAYdlw/bXZnpaTx9EZ3SUKeqB
	xdZjheRVAEdTRd405Xq788s=
X-Google-Smtp-Source: AKy350ZKZdm0dRFxGifIQ3GKK8AkOBHlkVuwM6+I/CnRiDVsliuK6S6zz+C8e3YJPFFDy8rSemaOFw==
X-Received: by 2002:a17:906:74cc:b0:933:23c4:820b with SMTP id z12-20020a17090674cc00b0093323c4820bmr640720ejl.4.1680904243432;
        Fri, 07 Apr 2023 14:50:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ke19-20020a17090798f300b009306be6bed7sm2417284ejc.190.2023.04.07.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 14:50:43 -0700 (PDT)
Date: Fri, 7 Apr 2023 23:50:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] staging: rtl8192e: Remove unused variable RF_Type
Message-ID: <7710a87f627dcfd2d0c34f14f583625ffab10660.1680902603.git.philipp.g.hortmann@gmail.com>
References: <cover.1680902603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680902603.git.philipp.g.hortmann@gmail.com>

Remove unused variable RF_Type.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1a0177cd64af..b1729d65f67f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1393,7 +1393,6 @@ struct rtllib_device {
 	size_t assocreq_ies_len, assocresp_ies_len;
 
 	bool	bForcedBgMode;
-	u8 RF_Type;
 
 	u8 hwsec_active;
 	bool is_silent_reset;
-- 
2.40.0

