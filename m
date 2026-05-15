Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4681B808
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808845; cv=none; b=lrKAmCD9ETe4xubYzSjEOGM/IMs4NuYiqdBjlCobPZspUCiyFd2xfAjVv73ll7nBElkdKQrbirFdEsRGxm6vSEQOGmDssrxHl10dRa5rIL7XRTag3I+4u8hvXFQJ2lKDLedWkyYCMoKHqpcHDaCz227WLkOrzwGSAp0UlLm4qBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808845; c=relaxed/simple;
	bh=xAHSBYDP6W/ya7H979vVgrYm6+UeSkQpAh7OsBt7vMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gzsx75s6M1iYq5PrmDqVgR+u6L5SQ1fA50E00nvhP9atIGZsdkFSCL1fbd2NR7QvBgKNNRlCIrLjBJy49MtQblnNvVMhRAkNHBtAQe/YSIsKJhHx6SLAghDCT1EGgNwQ+aiD0mN2Ze1uTQCvLxf6+O9qme5ex0hZFF80uSMvhNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EppQ9zoe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EppQ9zoe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3680540a6efso3929955a91.2
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 18:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808844; x=1779413644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=EppQ9zoe55R5P7BhzApXRsR5rZA1bErsFQ8wh9+STWj2BxopRndeAd+SPjbLZ2JJ0q
         TRJ7xdHsrgvT9GpHreXX2797aTT6sVipqQiTBgbj5Y9aWaES7vE5eeH9gsbzHUR53IEz
         zpe251WFyPab5rlBJUS3pw97hW6Xmw5HdMGEzjLLoSQXHhRPg8EitPxR1HlviM50kB/V
         XcDpVKC9eYz9+d+wD+CDiPE/G62xF/GKpIINu+fgm71YKTthVYt2h4V8QKiax/zFowlL
         vlVHlRQhYiGQ2nxV11dbFTzhLWr4LaLBC3u0HeZgQDl9SrhwXuk2GdjjhcnYKN7lEhh9
         Wn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808844; x=1779413644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=Khe+lqRVTczMzA6vxMrW3qo+xzHU9uNg0mUH4ksfp/aJXV193zqFZ1mPEM/OrPVzKC
         VKI9CXaHNe9UL7dsLrKn9kDFzRgKsNSkg30cqC81vBxTPeZXQ4rLTgrWSo/puqLt4sGs
         UrJMuJw9LO2Ktq4qoGB8kTN50RIZyba2fK0dhQ4IVnD9TIMSImFH7EXipcTwK5yHY98l
         awL0B0/uj7KrSmgo+sTcjmpC3LrNjJtJ7BoIGJgSux8MgYaZWqLzTCZXnZ7xs6+7LNRv
         lpoKZa+PLVZ2kNufTgcfTvCaDENBsBCNasmGt0EGO+ZkiWz45UuhWvsA7xg83Jrg59jg
         IjUg==
X-Gm-Message-State: AOJu0YxjhkDTl+xh4fNpRhRtdlo4DmuHkFYP0So/V2+Bb0XmoV+XMZhB
	+C6m4bZcmBKUk5Qhl1IaXIYqMpQAHwDbof+5/adFlkNhMNhP2Xicezhb4DFXQ9uHASc=
X-Gm-Gg: Acq92OFjhUQiT7JaHdEnd6RfH2MRKttBkOhv7ECpV4BY1EzBfZyS3K4rcmSq8ojsVYm
	YjejTE+hBW5Xu9EtdplxkqVi908aWJaodwOJxP8nfYmZp8TZfNUNdiVMBkaG2ybrtJenH59ML36
	jXb66KVMGIldiBo03M66KLMA/i75zK3iLcftSTm0QGWhz6AnFcXvxWIinmz68RzQkOBcrjrbLUW
	jG1eXU6tQla1KbfKz1kQBM0ZQE3rpZglruiQA+JzU7C2EWG1dpVbb7H7zIpvcKJSIhQmpXzxJC3
	XZihfdJQuTW073dLVs4/aMiwNdPWyDKzEa6um5agICxmU2OpCE2frUJ4ooiyytoWTYUAVtunyn6
	xDxeQYIvL5Fuu+y83RaSvEBcZbqWeoZLYfqg+NeaTGKnlygUEYVnQV9tiNeguCgp4koNU1qOMh9
	m/V0CRsT6d+mQCk2v5xStJUZQ8g6PnIBaIWoRo6irVOz/ZBHXx7+G2fkKlsNhslUzcKXPSekHjW
	g==
X-Received: by 2002:a17:90b:2752:b0:366:173c:9a94 with SMTP id 98e67ed59e1d1-36951a6725amr1728143a91.14.1778808843973;
        Thu, 14 May 2026 18:34:03 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd7e8e5904sm10395355ad.64.2026.05.14.18.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:34:03 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
Date: Fri, 15 May 2026 01:33:52 +0000
Message-Id: <20260515013353.61614-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
References: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to the else clause to satisfy the coding style
requirement that both arms of an if/else statement use braces.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 987d05816c5c..2be74f2d4ac8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
 
 } /* rtw_efuse_read_1_byte */
-- 
2.34.1

