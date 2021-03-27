Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1270
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v11so8360393wro.7
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsiW3CmcCaVO2OVq6Ce62U9J/kZUCHAmiDQmSX6AIO0=;
        b=lqd2kXRCZWsJoOBXe2EY3IbDSKTTXWnlyNVVnMAlFgU4QlAhirpIbg0t0jFHDVhYdA
         rGVgE2wdklH86JW3ENrMIN+rHMriREBj8BoJ5NrY+5Xh7PmBCAODKDIkwHQkmC4hME8g
         2c7OYh3qBsUXCLKL3v8l2x4zUEnTZrPAdMJZFOHE/V2/Sz1X1Ab7CX8wbDLKpcQitnhi
         baR+jU3jZmpkeIkru5+wOd1VCjMQQl+LSqn68HHnV3OYi/rfL60YdPom9NYibeqYOmLB
         DGc+Z0w1npNSHPhcwKsEf88kSle3q2sZfNVdhMLmbOC7JagCYKWRMhQy9tLbexSWp7+0
         HjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsiW3CmcCaVO2OVq6Ce62U9J/kZUCHAmiDQmSX6AIO0=;
        b=fyoV4gNxKQZFrwr7Eoch8VLTiVRRobKOqXqazkxmjl+vR//uKUfdNttYCynSVUN9d0
         MFHeA/VsyNDthnG4HlHFNqaVNfNZ7VS1rWIeN0f5EO3MaBJb/cTzinL2c2jqhR9V9P3Y
         GkGk9ULujf0mhy8yT+TttT3b3XmbueZRf1wPwPv6RgUS3fMxIqaCfGyMBsKYVIE8bdlL
         2lpqIWKISvYdBr+a8SopmkIZ0rJ1S8ipy0ULy3ykKw/momkoDo9UTIQAgOJBopQgOsVv
         4RsGSJxGckO9N5OzAAvWOQ1+yoxwLhjCwKHKvyKBvg8f9GnUV9FNlBr8FfJjd3Kt3ZLj
         YtZw==
X-Gm-Message-State: AOAM532dE7gQiWjQyBqytCfYcQN/ODYcDiIxaDXbysv+72uIj9GWNcvx
	8qliD3NjOidhW65ht3zoWHE=
X-Google-Smtp-Source: ABdhPJyuY1o+Q3aKjzvFae2GBAhMeZowVNYUx51UPVYYK3j2Ij1h3uvIV/qCgFuL80R66Hl+dCgEew==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr19540289wrt.280.1616855086131;
        Sat, 27 Mar 2021 07:24:46 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id j9sm16161576wmi.24.2021.03.27.07.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 03/20] staging: rtl8723bs: added spaces around operators in a macro in include/hal_com.h
Date: Sat, 27 Mar 2021 15:24:02 +0100
Message-Id: <20e455aef3b24a46dafe32a8bb46804f284e3c1e.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

added spaces around operators in macro expression

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 55f9caee6610..a1e1b76b5d8a 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -180,7 +180,7 @@ enum rt_media_status {
 #define TX_SELE_NQ			BIT(2)		/*  Normal Queue */
 #define TX_SELE_EQ			BIT(3)		/*  Extern Queue */
 
-#define PageNum_128(_Len)		((u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0)))
+#define PageNum_128(_Len)		((u32)(((_Len) >> 7) + ((_Len) & 0x7F ? 1 : 0)))
 
 u8 rtw_hal_data_init(struct adapter *padapter);
 void rtw_hal_data_deinit(struct adapter *padapter);
-- 
2.20.1

