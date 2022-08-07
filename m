Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E363C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:13:46 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id qn6so1057259ejc.11
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=+FsM9BSLLhQlcBk3zJRjR04gJAe6i1I5jpWIJQymm4Q=;
        b=G9lNccKYXi936800LuvsrO6U9gwlyjprNZJqVFunrUPoeNUJeaCWgRdxklKtIPcIBa
         7YNaCqWFOLf2XTAU5tQU/MwvLGgIFnFHLEcdaBSBiS0W3feuCeiWT2xq7+0FEAi7phZy
         uIrdY0N3iVFeok6QtvYVp/5Vc2YY85gS4F/RSsoE35EQtpsQslCZt3SgeourenCRjUw6
         xvYW4xHflB30QVefC6n/xz6whJbBzINPn/mlQKcSedv0Yi7ygxACQ7UPBcutLzt02TvR
         5c74TYdL5focUaDU8hqNBkXEEr/epiLkeuzwQUT41SCNilwuwW4LMkI3RsSxboCA17+C
         idTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=+FsM9BSLLhQlcBk3zJRjR04gJAe6i1I5jpWIJQymm4Q=;
        b=fE5q3dYeW9RTCOqK2fHsyIoD1iXjuwd0p/kYZT4TTw6k1NKk1otZeZsl8nJ0q3vtlr
         +BQSrdAc5VAuOL2YbOLFAJD4ZU+30/pzHxvT0HgmedvS0BdiTvLx4qDU61xRXymQFusL
         M8BaqvI2Pjjy3shILhC06224vgpsXyNglmM3aCmDLBFwux9ioUCAJyc/qtcVUItX0SIE
         uGueQwQVC+KVrH2u/Jpb4mkPmNWoDJusjkzwlMU30YIhVpLIrQ+90fGlPlPN96kM4vAT
         B52m6DTuSMrey7GIi/BGjqYhmGaQToqIgVMqPo8fdQAXVDEQWn+XthXW6sssAoCdtQbM
         WU/A==
X-Gm-Message-State: ACgBeo2bw3JiLV4UZQcdqgbAIMSozuBHG37/q9FqNUA06CjeKPZHr9vI
	p9BZXBnmxTCnuSboPEoKBpE=
X-Google-Smtp-Source: AA6agR5nJtgs4H6oxgLQPmN30x/Pt6UcZezLdIKnEceF7jwGWJcrpU/O6N181CjwcMsHekov3oaHbQ==
X-Received: by 2002:a17:906:9b16:b0:730:d5f4:d46e with SMTP id eo22-20020a1709069b1600b00730d5f4d46emr11412955ejc.701.1659896024608;
        Sun, 07 Aug 2022 11:13:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906200900b0073100dfa7b5sm3083158ejo.33.2022.08.07.11.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:13:44 -0700 (PDT)
Date: Sun, 7 Aug 2022 20:13:42 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] staging: vt6655: Rename function MACvEnableProtectMD
Message-ID: <927d7c6e7c9d5214e4faeca886efd2696b2abc31.1659892670.git.philipp.g.hortmann@gmail.com>
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

Rename MACvEnableProtectMD function to vt6655_mac_en_protect_md to
avoid CamelCase which is not accepted by checkpatch.pl and to clean up
namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: No changes
---
 drivers/staging/vt6655/device_main.c | 4 ++--
 drivers/staging/vt6655/mac.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index dc50bff4403f..ccfd4bfa0502 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -225,7 +225,7 @@ static void vt6655_mac_set_bits(void __iomem *iobase, u32 mask)
 	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
 }
 
-static void MACvEnableProtectMD(void __iomem *iobase)
+static void vt6655_mac_en_protect_md(void __iomem *iobase)
 {
 	vt6655_mac_set_bits(iobase, ENCFG_PROTECTMD);
 }
@@ -1475,7 +1475,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_CTS_PROT) {
 		if (conf->use_cts_prot)
-			MACvEnableProtectMD(priv->port_offset);
+			vt6655_mac_en_protect_md(priv->port_offset);
 		else
 			MACvDisableProtectMD(priv->port_offset);
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 84d203c56b1f..4de9974e6c69 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -12,7 +12,7 @@
  * Revision History:
  *      07-01-2003 Bryan YC Fan:  Re-write codes to support VT3253 spec.
  *      08-25-2003 Kyle Hsu:      Porting MAC functions from sim53.
- *      09-03-2003 Bryan YC Fan:  Add MACvDisableProtectMD & MACvEnableProtectMD
+ *      09-03-2003 Bryan YC Fan:  Add MACvDisableProtectMD & vt6655_mac_en_protect_md
  */
 
 #ifndef __MAC_H__
-- 
2.37.1

