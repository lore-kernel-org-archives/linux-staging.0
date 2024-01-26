Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACC5812C
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308310; cv=none; b=C/wWlJNZjeWZC3SYT6T4MVC7K8o9fZttE2T9bRt0ZI4TsTFfsHxsgXi7ehrVCczpN4e1ai3L1JTBVxFsrmc1fdkrns61npw0WIbHNJM8WPrnBbDT6biM5zJ7uQvEd3TPmLaEnedy5P4K05pJlH/snD3KVo+rLqR0NzA6c8Om+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308310; c=relaxed/simple;
	bh=bXgbQVHALOit0JpLxby/llTa8pMZ7z5TUOxAybcey2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cfubATMd1iPGeVEgnSwUo2NQ8FAHMnCrp/8CLhpA8GATcu4tCrjRobXvzBDhdvWWDS5QPi+ONxfI7gOxcZqroCw/jIn3yajedl7NwcDpcQLXABDx8Kg6YjAabr7UkPqQ8jUggB4vEkq/1zHtT9/dKQ0e/GfdSIzdEzHlNbJEbGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=WwrjPXyF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="WwrjPXyF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d71cb97937so6938575ad.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308308; x=1706913108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuMPJtFia+dzORGwT4oKwk5DTmcy4HXJHzRu2k9t7Wo=;
        b=WwrjPXyFZj/xU67AwA4W0s9gmDyaSiMvUN88DClaB2xJHgtsyEq2KsOwi5PNVYGvEm
         fXEQ/PkQsDb4qij9c1YY2UcIqw264nrzVUeX+AEgSk9U3KbKz7xQU6auQSUZlNiwDv0n
         gHv/djG+SJJXhyshx+kL3OlT3O0AfKwBO3JT0Uq4xNW0Xcvq3Ynky+Dk9Xs9Ip7qs3WS
         j+KccmKUwAp8XZv8haPdwwmz+fX3/waNYeFn1QHaSJbaFl2/ghIOdKOL6VM8h5CBsPbf
         WW68iyyxEB4KCLzOzNNDTzsDELyV/zZq6loeEqW9w5SfjjN0nilCOeR9XkVKdJYMIlKO
         hWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308308; x=1706913108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuMPJtFia+dzORGwT4oKwk5DTmcy4HXJHzRu2k9t7Wo=;
        b=fmAbbgnS5O+kdVGsqiaoE4WRMH94EnSihSMIQ6QaT3bEg/teQqmYvQQvWoKfRTJZW/
         GGfK6nCx7TRNsvrUgy1MZyrmVRfsSugfnVLJk60a/5E8yDvaxfP5Mv5SvyxQynVSdFJ5
         HBG/uhtQzjRKnsx+2CaD/qZ8WEbq4uDUXeQapeR75H+Y0JlxTKEC2uuEiwUFMd+fGUCB
         QromSD2BiqQlYRyFXa+DL3eHVYlnrxivKHmo5D0NBTUF6zruTaKjxhJPeFJM+Yf6WyDM
         5qXYhSM0ChdZDYPqAnYd6niWzqbx25uuGJaaiFLAtQwtjcZYV6a3G4O8voapW68n6dV7
         asuA==
X-Gm-Message-State: AOJu0Ywwpq5byfjjy/ySgipDze4zMT8I1a8GALgibVLZbnKoaDwMY5P8
	KT7h8qxhnLcWiGHdMx3H1Jt9Mr6ZWgHqEyIJmEi27CddKeCcBU5f069qR0aSKu0=
X-Google-Smtp-Source: AGHT+IGvwa3/HWJlOE3OkF7bG44KeH09Vpze5wvlGoHXrqTsYcXvAEgyeCN+4Wm7wWx5vxR7GWT6kQ==
X-Received: by 2002:a17:903:230d:b0:1d7:8b8e:52e7 with SMTP id d13-20020a170903230d00b001d78b8e52e7mr606102plh.17.1706308307850;
        Fri, 26 Jan 2024 14:31:47 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:47 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 13/18] Staging: rtl8192e: Remove unnecessary blank line
Date: Fri, 26 Jan 2024 14:31:01 -0800
Message-Id: <20240126223106.986093-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove blank line to fix checkpatch warning:
Blank lines aren't necessary before a close brace '}'

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Correct spelling mistake in Subject line
 drivers/staging/rtl8192e/rtllib_softmac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ab41632def7a..dc91e59f1bc2 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1081,7 +1081,6 @@ static void rtllib_associate_complete_wq(void *data)
 	}
 	psc->LpsIdleCount = 0;
 	ieee->link_change(ieee->dev);
-
 }
 
 static void rtllib_sta_send_associnfo(struct rtllib_device *ieee)
-- 
2.39.2

