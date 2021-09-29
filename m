Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FE2FAF
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 20:34:50 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g7so13267859edv.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=fVc4u3M27ejIgDXMiIJmY+yuSVPlHRgNnqreciJj6Ho=;
        b=dx3Z3A7TSRkykEEPXeJt1H/u4VR89cnkNQhTbTWnj/WQJ++64lbCNBTNGx4+mH5hG+
         03wH/S57u9JyrvlUK5cVWRbE5XDWIzvkl2LhM12H7SxNddwOfJUPr9cRITf+KnXeMw4k
         nvI/+Q2kZGKW2QDldEYH4xLK+9u5F/EEypkK0A7QKxKERjeMzhh+SWH9z+EcoyUPkSvW
         o9U1g7/dMUvQVJRNvvDEGSqguRJdyWMA44a07iAyjaVEw3XZ5HHh438btt6dNBBlILa9
         swns6595g5pklMXMY4lqlAXqjM0d8CF9vrSdPW81kD6V5J5zxv6QgcS4vm6mrAWKV/8V
         RzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=fVc4u3M27ejIgDXMiIJmY+yuSVPlHRgNnqreciJj6Ho=;
        b=w+v4+b3K+K79ZjfOikDGI6Q+MbT5QqdzjdvuA9vTWUzfjqwwmQUJ+nNc+rq5BxbLDN
         nQiPHetvf6CXhUfmAjWY8rNCwkAVteJT38430Iq2o8rRdsxL7i5oxU75GadrnrYaK17P
         TvTfkNuofJYBHQmNHMZtn38wdMM0iEJAvuBBTjfsFbK9BKHX7dlpx4cAnAyYimsp/x1A
         s9yjH9VTZ4xSEfw3DXgKIUbvbgejSu1eh31UnIzGdGpJUGr7XvisheRddKrgZUE67xSZ
         IMhp1GAe/02hDXFPirmNVoT6QwYxtviRv2VG+zle1z1m3jXVadqd7913W1PaciPNdbmp
         sYWQ==
X-Gm-Message-State: AOAM532PE9SsRpe5mB+/zE/IzbawQZ42J6J1ASwir3yzvQOIJ9jUlNnv
	rOddlXNXrRg0qJgm2T11Ae8=
X-Google-Smtp-Source: ABdhPJzI+MppeVMsrWc2OPKcwXh7oBcczDCRmZ0p8DEobNyxaGuVaJs4vKste000YngZaw39Vkq2CA==
X-Received: by 2002:a17:906:b08e:: with SMTP id x14mr2256239ejy.40.1632947688656;
        Wed, 29 Sep 2021 13:34:48 -0700 (PDT)
Received: from kkobus.whirley.local (94-214-33-179.cable.dynamic.v4.ziggo.nl. [94.214.33.179])
        by smtp.gmail.com with ESMTPSA id kw10sm490022ejc.71.2021.09.29.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 13:34:48 -0700 (PDT)
Date: Wed, 29 Sep 2021 22:34:46 +0200
From: Dawid Esterhuizen <desterhuizen@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Statements should start on a tabstop
Message-ID: <YVTN5i8qwjlGwOPp@kkobus.whirley.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This path fixes four checkpatch.pl warnings:

Statements should start on a tabstop

Signed-off-by: Dawid Esterhuizen <desterhuizen@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_xmit.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.h b/drivers/staging/rtl8712/rtl871x_xmit.h
index 2e6afc7bb0a1..bc1287cc853e 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.h
+++ b/drivers/staging/rtl8712/rtl871x_xmit.h
@@ -182,11 +182,11 @@ struct sta_xmit_priv {
 };
 
 struct	hw_txqueue {
-	/*volatile*/ sint	head;
-	/*volatile*/ sint	tail;
-	/*volatile*/ sint	free_sz;	/*in units of 64 bytes*/
-	/*volatile*/ sint      free_cmdsz;
-	/*volatile*/ sint	 txsz[8];
+  /*volatile*/ sint head;
+  /*volatile*/ sint tail;
+  /*volatile*/ sint free_sz;	/*in units of 64 bytes*/
+  /*volatile*/ sint free_cmdsz;
+  /*volatile*/ sint txsz[8];
 	uint	ff_hwaddr;
 	uint	cmd_hwaddr;
 	sint	ac_tag;
-- 
2.33.0

