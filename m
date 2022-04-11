Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C91FA0
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 20:49:32 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id s18so10871523ejr.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 13:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=31uCAJiyq7QrqdMYo3XU+OFlXDPDCua4Bs/5v7Ob/uo=;
        b=EMyoI33OZNOXsnQUqwxuKbE/1kfi8pvyYRP4JJOnqqBLguymIjgREKWey3l0nWGvDX
         e0bkvT/9nwkF1b+kCDvvRu1OK8CpzYVPj0P+EAZpkAq8EIQg0jJx7WRYxasMNJkA6wqI
         HZ1Z9kVgu4kEbPGlKbOCK9fjua0jmgJaVOdanwbfjCtEoCky1RQhq+kEvcxRriuKX09Y
         vYFLUx5lv5JR7G4I63cy4Zzw7R8szLmWIbYlDNsry1zM3475v+7xvhuung8JvlsN+dvt
         CEGUo4Klppdyx/LhK9civ4v5Gudvp57ylpazZ4OqJKOAfqO+hq/YoSw2Vlv50nI6k5cj
         l0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=31uCAJiyq7QrqdMYo3XU+OFlXDPDCua4Bs/5v7Ob/uo=;
        b=OagGYmD3CB3K60uqbV34Oo5RQu8OGiy8AYfkasFaJel/2dkrxs6kCvwB1oCyeLWOz9
         6m67tFKYxvwniSKTraxH1+rekWUWWUX3QIeRDfs6zOWBijiexp8PAIakd2ZUFr/iHfwF
         d/jO1Iy4w1/ewmdYiJr8QA2CXxVU64bV9E9vkNvXUzFDFpmgxU4Ps7rkVJsT/LaLVih8
         g0FWkttxXZSjhS3q3iwlToDO221m8s9FFjUSg8Gtk/AbMTktptzaZ/H5G8MJEX0ucBRB
         S7wJG9vs0/5hBK+nu9i2iUTaPIchd6gPmYfnPqe3JqBytk+5pWn4IZy8k1upjf97+NLJ
         6XLg==
X-Gm-Message-State: AOAM532AkuDBZJn7B5otC9i9VhuE4hBFWr/ARLTAJTj+CuhT0EXvvOtu
	ZyYAb/9pDuAVygHTlr507N+d9Ylk8gA=
X-Google-Smtp-Source: ABdhPJxJodTfjny+R0IqyIY3sjWc/vYuaDggsMt+TWW/Kj586hiQH9QbVCdBx1cD1jnems7PZiFqXg==
X-Received: by 2002:a17:907:d20:b0:6e8:4090:b9db with SMTP id gn32-20020a1709070d2000b006e84090b9dbmr20044655ejc.480.1649710170959;
        Mon, 11 Apr 2022 13:49:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id e11-20020a50becb000000b0041b64129200sm16222363edk.50.2022.04.11.13.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 13:49:30 -0700 (PDT)
Date: Mon, 11 Apr 2022 22:49:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] staging: vt6655: Replace VNSvInPortW with ioread16
Message-ID: <c8b0bdbe8ef47b8264acd0e1705e92d551822880.1649706687.git.philipp.g.hortmann@gmail.com>
References: <cover.1649706687.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1649706687.git.philipp.g.hortmann@gmail.com>

Replace macro VNSvInPortW with ioread16.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: This patch was 5/7 and is now 4/6
V2 -> V3: Changed from
          "Rename macros VNSvInPortB,W,D with CamelCase ..." to
          Replace VNSvInPortW with ioread16
          This patch was 4/6 and is now 2/7
---
 drivers/staging/vt6655/mac.h | 4 ++--
 drivers/staging/vt6655/upc.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 88bf5dba9b43..4e7875ff9ff3 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -548,7 +548,7 @@ do {									\
 #define MACvWordRegBitsOn(iobase, byRegOfs, wBits)			\
 do {									\
 	unsigned short wData;						\
-	VNSvInPortW(iobase + byRegOfs, &wData);			\
+	wData = ioread16(iobase + byRegOfs);			\
 	VNSvOutPortW(iobase + byRegOfs, wData | (wBits));		\
 } while (0)
 
@@ -562,7 +562,7 @@ do {									\
 #define MACvWordRegBitsOff(iobase, byRegOfs, wBits)			\
 do {									\
 	unsigned short wData;						\
-	VNSvInPortW(iobase + byRegOfs, &wData);			\
+	wData = ioread16(iobase + byRegOfs);			\
 	VNSvOutPortW(iobase + byRegOfs, wData & ~(wBits));		\
 } while (0)
 
diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index 44d746de6344..99bf7aeb56f7 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -20,9 +20,6 @@
 
 /* For memory mapped IO */
 
-#define VNSvInPortW(dwIOAddress, pwData) \
-	(*(pwData) = ioread16(dwIOAddress))
-
 #define VNSvInPortD(dwIOAddress, pdwData) \
 	(*(pdwData) = ioread32(dwIOAddress))
 
-- 
2.25.1

