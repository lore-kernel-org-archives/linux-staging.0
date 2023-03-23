Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154E58F6D;
	Thu, 23 Mar 2023 12:51:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y4so86158706edo.2;
        Thu, 23 Mar 2023 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7HvfwciuqSvsnKf4jcKZ3F5a7TDTuPwSv9a3Pc+zGg=;
        b=Blvb+qIxtAHszQDyGJ9wWWfO62C7FWacM/wFm6iIcDCulFG692mp4FsLEdZEPE89Mj
         fNJpuFFQdNBT8M0sfWgQcSnOnTfF41reSxE8Wblx3Ojk1if7jrs/X3hIgltkewYO/kmS
         HWzlij8o9GTc/9ftjzuMl799AFLo65v8K7GrDoSjCFxdTWi32tpKTvLQutO4Vbm1qzBR
         MzZVMVwDTzIbbvXMmN9Zcg5HacPBCjipEHWNTS1Jm8qkzWalzVVUtHq+TBEZ3JsKDieN
         mklRzd3Ln6qNOXcXNwNdhLIZVsVLNWrf/aqpxkuyFrXO2Mm44W3DlZ+2uTLO6YrQx8iB
         uhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7HvfwciuqSvsnKf4jcKZ3F5a7TDTuPwSv9a3Pc+zGg=;
        b=qtUAjIxwPuH2JF0d2n9BDKrgLKMnVW/lbokiT1rRYD/jtLrrEfLSRJVwStQcTCLMs9
         UlSYeHo3qvphDEN101CUG1Gz0IoZDusHJH5RlMWGy3lrNeS+czn7WFj60BeEYkNhYjAa
         4VuCUVkee7lEs82tOl0VVn9kkZtrcGJCb5sCAhkXRbdevegKbZc5A1/iEAg2/qCF21EF
         B/hkUXdSR0CJeBWd5Kj74bWx80TBr89V65ETVLVpx+kXuwBcjNeNNVIj5O3aKEG84NcP
         UG3wkXMHMx/tsJEWepDFcjZ0UGy1hD+UGdYMRbZMLNrs8ZXnCE3GzQAc0PtqdsNvFit7
         e7RQ==
X-Gm-Message-State: AO0yUKWzvqZVkFdj1oN8O3vr3HAwnBOvEBn7nNb+CFSx+YYIfphJX6qL
	ZY9/iO6h8+mKmcCV2G992Xo=
X-Google-Smtp-Source: AK7set9qXDi2SIgHgRXCuy4IkvI498IWpPdrcCUJ7fAtaWYPEZA0YvZ7hvjBwgihQmASGTvumocF0A==
X-Received: by 2002:a17:906:ce5c:b0:933:4184:f0d7 with SMTP id se28-20020a170906ce5c00b009334184f0d7mr11469572ejb.69.1679575890296;
        Thu, 23 Mar 2023 05:51:30 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906309600b0092f289b6fdbsm8587430ejv.181.2023.03.23.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:51:29 -0700 (PDT)
Date: Thu, 23 Mar 2023 17:51:27 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] staging: most: fix line ending with '(' in dim2
Message-ID: <ZBxLT4w0cKZ/aOZo@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the function parameters right after the '(' in the function call
line. Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/most/dim2/hal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index a5d40b5b138a..6abe3ab2b2cf 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
 		dim2_clear_ctr(ctr_addr);
 }
 
-static void dim2_configure_channel(
-	u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
-	u16 packet_length)
+static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
+				   u16 hw_buffer_size, u16 packet_length)
 {
 	dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
 	dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
-- 
2.34.1

