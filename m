Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439B279E4;
	Sun, 24 Mar 2024 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711313498; cv=none; b=uwBHqPEakmEXmLBCwU/cuRTWz4b2/uXUBFhzPwe7R72L25gN8L+Lu6n5lPWgQ6LmitKVfm7NJHeiik1QwWI13bP34B+RuZppPAcByUco+DF7O/bRfULY9aL6cHyrbcn4F2hDE5noHYtFTNDhVoZ4ip1orkSzWU4VKYDdbZ9I5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711313498; c=relaxed/simple;
	bh=xbED7VUAQKgIJuZaHw9k54Q7oJJJIBBD9cMqZQxcZv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL38n6PtLDPyDpej4KYKZUi6amrHOFK87iZvz1Wgr1EJCmO2kEjnOw0tLnjD7oW++ixd3x/KsXLedyjeDeLcboXs7WTHen+RtNKjU50p0U67TRkBo8JMfbT4RP80F8453S5UxFt4TwoDD1AJLCljiRPD7OjLlgrsyNFcSJq5eJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCypgxKC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCypgxKC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dde26f7e1dso25856125ad.1;
        Sun, 24 Mar 2024 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711313496; x=1711918296; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qghiSz7D9sCAzbkITRm47/uYLynPy7bJABS0ecPLalc=;
        b=bCypgxKCH9bm91gSlelnj8ib0LINEbhUkA/BgYY2CnsX03HE7KfL05+tPxgq7xW0y4
         YocAgXqw725kAPl749iagD09cluo2fnsZqBwZN0PSdMKagb2jg3C+PyW7/L86zCiqvRd
         1ibXTh4lGF6BWCo0QcOJhsjDpKEe2Osvius14fkMCq+EbeR2lRAJqeaM8Kdo2AH+xA0B
         uZ1U+4SgVzmHAZUsnVykQFUFKQ9ugb9lFdRbobjkC00ibYAXSCnWfce6oxocNXTQPp6G
         2z2d24IRfM8K8axCCw2kxdm3UM8wxmO4UZVILgnVSpJBwjEvct6QefVulJ/kuIC+V4/z
         ZS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711313496; x=1711918296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qghiSz7D9sCAzbkITRm47/uYLynPy7bJABS0ecPLalc=;
        b=UCQyquuAZAuUMw4ylhWGZ3M4Qwd2GBelgZJxm5l6tNSLtzAWKJi58u7XKhsIq9r5tW
         T06z5z3eau2ylDJxLN64Li95vq1wx1ZkKsRdyVE6W7rUXjiWTeGQxl+6tjI8wFbvOhLa
         0m7XoM62EWkIrYfdXv54PdsA0wZIY7QkfQ7CGBTxDqbgWKm0A8CB3K32S3NpciOPCbtf
         lhiFFKdWIBg+ubuYK6VJLdL9iIehbQYA3kCkg4axNaGVCFKHO6SuOikccqpydM/nzFL1
         +praUs5qtEvN3LRVo3D+Cfpr1kXyuz0OHq0Q2DT5iFKotqiC9tmEQ9rZ0C+Y568shopt
         kIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw5FyIlEeR/xbl3YaBpOdL1eNV1HBuyYUJykwyrN6pTZag44GmjABrmRbgHWHnnhkZJleikV1shZZdXlv5VGrG56Bn1QfQmV+tCcMLYA==
X-Gm-Message-State: AOJu0YxW8ltWkOTJIlaOvYIcFO0bapfCzMtdlZTC+Q0PbdQ5zZUDe+BV
	+W3oxc9sJB2sWwjP31t2zY+0TSKtwW6OMt18XdAm6gJSywoZIq8r
X-Google-Smtp-Source: AGHT+IFT3itD9WwTTd7aLXWbH8yVFWJ0LSVdFyz60u38dLBPgfQXpDcWGXYwmEmAHYX2ZEgXsRDTgA==
X-Received: by 2002:a17:903:26c9:b0:1e0:27c8:5c7e with SMTP id jg9-20020a17090326c900b001e027c85c7emr4804997plb.25.1711313496611;
        Sun, 24 Mar 2024 13:51:36 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e0c568ae8fsm64157plx.192.2024.03.24.13.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 13:51:36 -0700 (PDT)
Date: Mon, 25 Mar 2024 02:21:30 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 2/3] staging: rtl8712: rename backupPMKIDIndex to
 backup_PMKID_index
Message-ID: <2902ed6252d6773fecd32254383eefe8b0c465aa.1710965653.git.ayushtiw0110@gmail.com>
References: <cover.1710965653.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710965653.git.ayushtiw0110@gmail.com>
Message-ID: <20240324205130.LNzrEyo-nQxVe2JaMtT8Huwy-8fu_V4vuqMVUbWaS9k@z>

Rename variable backupPMKIDIndex to backup_PMKID_index to address
checkpatch warning 'Avoid Camelcase' and to ensure adherence to
coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

Changes in v4: No change

Changes in v3: No change

Changes in v2: No change

 drivers/staging/rtl8712/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index a009ec1a5c11..ac8196d24ce0 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -87,7 +87,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
-	u8 backupPMKIDIndex = 0;
+	u8 backup_PMKID_index = 0;
 	u8 backupTKIPCountermeasure = 0x00;
 
 	r8712_indicate_wx_disassoc_event(adapter);
@@ -102,7 +102,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		memcpy(&backup_PMKID_list[0],
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
+		backup_PMKID_index = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure =
 			adapter->securitypriv.btkip_countermeasure;
 		memset((unsigned char *)&adapter->securitypriv, 0,
@@ -115,7 +115,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		memcpy(&adapter->securitypriv.PMKIDList[0],
 		       &backup_PMKID_list[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
+		adapter->securitypriv.PMKIDIndex = backup_PMKID_index;
 		adapter->securitypriv.btkip_countermeasure =
 					 backupTKIPCountermeasure;
 	} else { /*reset values in securitypriv*/
-- 
2.40.1

