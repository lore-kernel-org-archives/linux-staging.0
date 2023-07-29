Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420F1FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99b4865ad55so83989266b.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617217; x=1691222017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vBQvA7PidF0G5yJQQDU0VXGO4IEZc5NbIaIsAqJ7tbs=;
        b=Dp27GgGxBiNTmPkOQnVqGdr5F9RxNvkQ5/GOds9VxvAA5B77Gz/abPY0pFNhJlzKf9
         TLMA3+pF0vDCmdEEDUR/4EcelyeSmeA2LCtoPbSqazaRX56QXynyfXyWoHkjd0L8zZXg
         mw3qGcVhmPDKYENZo5HosFNbltgp+bqcFjj/vmVMYgv2VQ02mjWRVZABlYqGeHNNLbEA
         Im7dYI99T6/BwX2uDWe++/uEvMzU3fKEkQEc5ZgsMzSnWdnX7+gWhziRWTNUTnlfKbgg
         yKioxPKEa8G1dfwvTo5UFMK/d1BXKdzEUkjJl+f8UvMtxo1u5eeQvbcpIUEk1dhEmupS
         yV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617217; x=1691222017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBQvA7PidF0G5yJQQDU0VXGO4IEZc5NbIaIsAqJ7tbs=;
        b=bi0QYR2BBefCZYuyxK5lE51ebRVMwbDvtOPxF8uQRwrjKSJ2jb931Wsw2BL6rz29bo
         afi3MRHu7ajiR7Onu4jlhzH7N/22oJEnKZN+HANYBNugxvQOjHgI7F+yZm3Fmw7q8evV
         04LQUX2S89o4JYme+cM3n7AqFNMnmxARIzBfgn4tdA6VQXUIqcsrIwLCRWMjFoeCgleN
         2h/JvEsp2+o+d5kDnLqwQhsm4RyXgS06QdGAPZtn/eHz/m/0zzmsj+LIpMW6MPsCjhUs
         Zbm2FM4FODj6wWoNwKSfaOVmIL0yYs80WTJ0kqsBIiAHLKg6oY49TFF9800EBsERDDad
         cbew==
X-Gm-Message-State: ABy/qLZCKWrkfD2VOK6qCVzJCCHF8048cTOGKQNeEL6/dNSoPFJFeLUg
	tYtSj1+mW4epojPq11/lGW8hXujo7vs=
X-Google-Smtp-Source: APBJJlHnz/pKlZ3uSK8sTzQwjoUEr9DWV7dXYRLLKsBz2TJlaMtBlL8BlZJMyYHQ7mFXqDLDQW6uxw==
X-Received: by 2002:a17:906:5303:b0:99b:4670:aca9 with SMTP id h3-20020a170906530300b0099b4670aca9mr1233266ejo.1.1690617217146;
        Sat, 29 Jul 2023 00:53:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id w23-20020a170906481700b009927d4d7a6bsm2987619ejq.53.2023.07.29.00.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:36 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove is_mesh from
 rtllib_softmac_scan_syncro
Message-ID: <9fcd1193c155ef992493af3526442fb84032166f.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtllib_softmac_scan_syncro() has unused parameter is_mesh.
Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 7b866b3a46ef..0e52b207942d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -478,7 +478,7 @@ static void rtllib_update_active_chan_map(struct rtllib_device *ieee)
 /* this performs syncro scan blocking the caller until all channels
  * in the allowed channel map has been checked.
  */
-static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee, u8 is_mesh)
+static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee)
 {
 	union iwreq_data wrqu;
 	short ch = 0;
@@ -715,7 +715,7 @@ void rtllib_start_scan_syncro(struct rtllib_device *ieee)
 	}
 	ieee->sync_scan_hurryup = 0;
 	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN)
-		rtllib_softmac_scan_syncro(ieee, 0);
+		rtllib_softmac_scan_syncro(ieee);
 }
 EXPORT_SYMBOL(rtllib_start_scan_syncro);
 
-- 
2.41.0

