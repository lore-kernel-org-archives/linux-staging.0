Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE667477
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:19 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5068638856dso2565055a12.1
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001359; x=1686593359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f90+s7Igr7R0Bh3E9BN/GprSOguGxSIypRawQW0lt1w=;
        b=GBAyjJwgrlQBo4qCirom1I3kazZPGDJHZ8/vLMAev4jETPYQ5ZI8oaf+GfYlRDB+ih
         Hm9HffyZ1EldF6ZrrrnxhFScj9LDNi9JmJEx0wm0zzp5c5HEDHMo8A/cih+DV+sgx2p8
         fK+vQNhNXIEhnYG+ArEnjrk8a6G/RHGPpcJ72HcTPy2fk9RZj8RJdrNB45Leii2kQ9Lt
         kii+y9JQWkh0MSd4iIn0LX+0vJFIRvzNCd/vq3VxroUaOY1sl9pT4mf3dTauY1GLjmxW
         PYC5aFncSAvzVOkT2r5RVj0gdjAAVIiO45Civ66G/Ywno29kQlKqvddTszJi1HOpRkV+
         WFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001359; x=1686593359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f90+s7Igr7R0Bh3E9BN/GprSOguGxSIypRawQW0lt1w=;
        b=FPvzllKik6ZqRjtd9+wdDIdWUq8b6vrBkTl2jxTK92QvVEtU9PzWRNZwZGzAo+Up8R
         ANyWrjqlUn3lvu80eyiCKxg6tbFsXt9tD7yZx4quWobYDl7JgkEBm2QoLrehaMuDr+N4
         5Ijfuy5tFYJrOzEXB19/NjHVn5KR0QUbmQYQyWIpaZrht3I9pcMbB5rp91PRbSuBH+7F
         WTKQx+00DRE5+Mz9z7g0tf4rHKhQHB5iPFs37nYUQp/mmau0ckjHAg66BhqHRXr9R2A8
         BuBGWgir9Naxjg7BXNlP03N0VKHCBPpvJiJBXvewP7dtimI844cpCdoyJbtbOvFkqZbD
         VZKg==
X-Gm-Message-State: AC+VfDwdjLAkbp9CbA+cLZW6IZkT61icbP4J83GEnULRjFzrTeAtz+uV
	E8ymGGxZrSt0Xv+RjRiIET6H77I0fiw=
X-Google-Smtp-Source: ACHHUZ4HDT3yZlY7XILkad4uBH71A/7AoaB5cNMR6d6DGOHLDzP21vRLhXERUMNrwPu4Il7VkzJqSg==
X-Received: by 2002:a17:906:7a50:b0:94a:5f0d:d9d6 with SMTP id i16-20020a1709067a5000b0094a5f0dd9d6mr23904887ejo.4.1684001359187;
        Sat, 13 May 2023 11:09:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id ig25-20020a1709072e1900b0094ee3e4c934sm7039695ejc.221.2023.05.13.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:09:18 -0700 (PDT)
Date: Sat, 13 May 2023 20:09:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] staging: rtl8192e: Remove undefined function set_security
Message-ID: <bdc9bc3a70ca2b5d86bdd2cb5c815d0b3c67972f.1683960684.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function set_security as it is not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 --
 drivers/staging/rtl8192e/rtllib_wx.c | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7be02cfe56fe..cc1ce106678c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1651,8 +1651,6 @@ struct rtllib_device {
 	};
 
 	/* Callback functions */
-	void (*set_security)(struct net_device *dev,
-			     struct rtllib_security *sec);
 
 	/* Softmac-generated frames (management) are TXed via this
 	 * callback if the flag IEEE_SOFTMAC_SINGLE_QUEUE is
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index 1876ff75c31c..82b537da8b21 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -416,10 +416,6 @@ int rtllib_wx_set_encode(struct rtllib_device *ieee,
 	 */
 	sec.flags |= SEC_LEVEL;
 	sec.level = SEC_LEVEL_1; /* 40 and 104 bit WEP */
-
-	if (ieee->set_security)
-		ieee->set_security(dev, &sec);
-
 	return 0;
 }
 EXPORT_SYMBOL(rtllib_wx_set_encode);
@@ -611,8 +607,6 @@ int rtllib_wx_set_encode_ext(struct rtllib_device *ieee,
 			sec.flags &= ~SEC_LEVEL;
 	}
 done:
-	if (ieee->set_security)
-		ieee->set_security(ieee->dev, &sec);
 	return ret;
 }
 EXPORT_SYMBOL(rtllib_wx_set_encode_ext);
-- 
2.40.1

