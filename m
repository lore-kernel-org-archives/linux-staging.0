Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034A3D8A
	for <linux-staging@lists.linux.dev>; Tue,  4 Oct 2022 16:13:39 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y23-20020a1c4b17000000b003bd336914f9so1115221wma.4
        for <linux-staging@lists.linux.dev>; Tue, 04 Oct 2022 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=l1KZpUgo00G/5L4dmMW5myayn4Zqd7m3fQ8mEVKtoi0=;
        b=ZaacCWCIe0ILL/+CwFEyO4+MxyQwkhPj6wNUBHx/wY4ZSIzoXw4ecmNJOCYM57Sv4C
         vAKGjElpFDakNao2KI3c0I4dTS6XTzz9EdDBu4z6927BruzU1CtKm0bGl6fqAAPedpWu
         rs9UhjZUc+EkaoCEK0EPc1b6mleAaw9jkD1D7kWIukyTJsSoHj62KTP2QbDa29qn0DbJ
         xfCx+buSmZrf+YOJ1UGmr8xU0RirEDs1zTa+MSMsO1WHfU3JFF69FvHqeFEQESkLk3gm
         xhZI9jtNNZosaQaWVWXG6aBvzdd9kzda2Aflh3/OeAt5CCrh80FRIDwGbkbvD/Kq4VQv
         WWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=l1KZpUgo00G/5L4dmMW5myayn4Zqd7m3fQ8mEVKtoi0=;
        b=77vvRamV++9QiLnHwpJ3rsNU1JBkIj4XC16AnEKXR9A8EZgBXkFCeNVCsoujk2PGJA
         yXGOWJh8OR+BUIkQz3kv5ZjLEITVYVgu4eyIBtXLroXmweZDHdtOg5pNNbIR63WCotUd
         FaSn71T9WJZ5LIOIVlgxBgBBkMxXfbB+B4qav8+pz8sPoLgNgqThU3uMFGFtsXltmJyr
         +hyy+DcBC2C6uoidPJ11O7R/NWLnijnbSjT34IUMVDooqSZsXSStERGq5Jn14xTK0Ekq
         aSHr/wWoew+aBlhJrhyh1kzWhxE6eLZicJU7XdOpoYnYCJ83jZfe6q8+0KU/6fky+Hoe
         whWA==
X-Gm-Message-State: ACrzQf2ERZw638eTWxQIf9uPF9Y+MdnPsM2KLvvr8VpUqyWhWBiqTpZp
	G4BSFu2yEu2U2ku/Ah5eZvmazOG8xixQiWdb
X-Google-Smtp-Source: AMsMyM5fuTuElVWbTJBd+GRRwB0eIy4mOiqZXTScu7eYqYNWJ4h3qgVk9rHIVmD1F/k1NAZEMaOc0Q==
X-Received: by 2002:a05:600c:3b13:b0:3b4:757d:93a5 with SMTP id m19-20020a05600c3b1300b003b4757d93a5mr354003wms.183.1664900018064;
        Tue, 04 Oct 2022 09:13:38 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id h9-20020a1c2109000000b003b4fac020c8sm19116073wmh.16.2022.10.04.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 09:13:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix spelling mistake "modee" -> "mode"
Date: Tue,  4 Oct 2022 17:13:36 +0100
Message-Id: <20221004161336.155337-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../media/atomisp/pci/css_2401_system/host/pixelgen_private.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
index 1c7938d8ccb5..8f79424bedb2 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
@@ -161,7 +161,7 @@ STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_dump_state(
 		     state->syng_stat_fcnt);
 	ia_css_print("Pixel Generator ID %d syng stat done  0x%x\n", ID,
 		     state->syng_stat_done);
-	ia_css_print("Pixel Generator ID %d tpg modee  0x%x\n", ID, state->tpg_mode);
+	ia_css_print("Pixel Generator ID %d tpg mode  0x%x\n", ID, state->tpg_mode);
 	ia_css_print("Pixel Generator ID %d tpg hcnt mask  0x%x\n", ID,
 		     state->tpg_hcnt_mask);
 	ia_css_print("Pixel Generator ID %d tpg hcnt mask  0x%x\n", ID,
-- 
2.37.1

