Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F641559301
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957414; cv=none; b=S9PHWSix4npdMgQyhnocFuc017233yS+uyXrd1tdOOifCJZZ2wS7/ZA24xgZevseT32eGC8MqL9F6unnkMoyL7x439Bd398tMqqPalZjAeOzIDMQXBymcvZTeNwQHPaMTsAis+Ox2toO7cWpLvYRu5YjoN3lfMGa8zM7reLF9hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957414; c=relaxed/simple;
	bh=9iJVKfbofuta5wUIlWjdU3gTlMJE5osJEWFg/8jwAI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EC34JsB8+3mAGdV6nGDbURInoHZr23Ib+nN9MxJ4duJchTWr4piDG1jmzdGIwm/LsVnJAUFLvaZR3AddNXjIpGgb1CDEX9qcDcC6thNh2sHPcKOxQDasWwWtY5R7pzaSp5tM8eyhUeQBBxx0hERxPHpeyyRHh/ZwQBc+lbEpTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF92fvRr; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF92fvRr"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-495501e57beso26217835e9.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957410; x=1789562210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx3fhksLVe/0x0rLzS+DV0zgnA9dPIadpHrbGOt07q4=;
        b=ZF92fvRrGNCYlCVqQ6h5MFsV+6gKiZy8NpNMpT4/33zCt9qgIFTb8j4ZN/eY6F5Si/
         9FEjIK9nfZENOFm7bO8+J/7h1sEsdDHdIpD5gQ5PNISfLVpoH4i5DRAP77bQ+Qi90J/9
         j3MnxZ/ZL5VSefOb4E/0mhsvIN5iN85NWtIJVqGIc1u0LJM+Q8KKX85v+K0+6Enathn0
         8Dj3byTTGfdey2KGDKQiBikrH+X0NdqNfEOOiDMDEvbkS8JClRleofWEUuES+2WjZLbE
         jROEStO95Jt6IKP+ggr3LpjKukS/JZXCrkZPtSeETllR/gpEcD8pmxxFPCncWhUdED6X
         usAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957410; x=1789562210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx3fhksLVe/0x0rLzS+DV0zgnA9dPIadpHrbGOt07q4=;
        b=eEmvK0j/d9v93OrMtHCcHM/LTB8/MDUHAZjqFYMn1tM1Bmts3Chdvw3o9QM+0guWeV
         Z9KnXiuAmDeJ4oQLVQckXogFwlYkkvN/sSBiZto1y2sr0W2OM8pHfLjn2vGhJ/gsuEPB
         1gknt50wMvIbt8t5KV7UPkEU+8SNTzyNlqi/4Vuc711B4GBNPYvYciIjr7Z8uFgv/w1M
         BzHirDSK+u6E5dIFcDu4baRH5mHs4NVEieE8Yybwb1Xuqbb+NDAAg6PUmavoHXYm8sox
         zkHUSHgKqk3/eT1+cyGtBLTZWcfRnxcKzKQZ4L7lo1zSk0yUtSmGF6MUiH/E05ykARDS
         GmZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNjV8IxAcUuw4/MaCzaEQQdXbbr4rDdiRd2Xi5M5M+VuZG3TV/lVhc8zFUCeRsJEVlWFVhq0bhJ0nqJya1@lists.linux.dev
X-Gm-Message-State: AFuF++n2KttaoNA+Ub8v8QKg5mL0DQ/cuenOnuRVthDiiJ5EEpxkSGY/
	KMIkEwzYyH38Juey7AB+ORSC7wxEnrPBH5C1QNjWzF9CNIvBKmNoduCZ
X-Gm-Gg: AYBFou2hZJtWtiDdeEy+DOl/1Rqdk9OI8E8k07FEN/wpqC1dXvyMXdZqQXX6fJY26Ii
	HjniI1BUde54DhH1rn8x69g4EPx8ytLubKm63qqi26okyhdaB/RwCjrO3HXf9pv63uoK82YkDlS
	5a4id2bXppW5hp0OaiCwkDcmCmfcDpKBQJAJ1Dj5BrNRbCKUzN5jfFD7J3b9M1iF1mMtAZ9is21
	e6NC/MAezGz/rhGlYwg9NMeCMZzbAIdg6ImyJPXTKOSLYowXQXhACINRy1hp4SHNsx0WzSFHALM
	KakXVSc87jUovoVYKfZm6KcnWFqpAVg8DOlYCPGN/Fuy/QrAt3rvUpTAHfl7TqDjoWajnTgdlVk
	CPgCVEDiRZ55C1rcw5vwBeheJOLSbT5ikPmZB9ie9PUXbyfn0iSWjwpodciGa7bma8Rr1YMsOAT
	FlcUU/jcrgRffzRxxiVPJFNcpTrUvhuAW0bwNyDfmmH/v2IqamndRObXwaLSDEE82gaCVHfrE=
X-Received: by 2002:a05:600c:1f8b:b0:49d:797:83bf with SMTP id 5b1f17b1804b1-49d07978531mr245789755e9.21.1788957410005;
        Wed, 09 Sep 2026 05:36:50 -0700 (PDT)
Received: from bera-gentoo ([2a02:ff0:c13:ea42:44d3:2042:c3d9:257e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm368009235e9.8.2026.09.09.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:36:49 -0700 (PDT)
From: b9788213@gmail.com
To: fahmymohammed@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in HalBtc8723b2Ant.c
Date: Wed,  9 Sep 2026 15:36:13 +0300
Message-ID: <20260909123648.174428-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908025910.155625-1-fahmymohammed@gmail.com>
References: <20260908025910.155625-1-fahmymohammed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon 7 Sep 2026 20:57:57 -0600, Fahmy Hassan wrote:
> Address checkpatch.pl warnings listed in the driver's TODO file:
> remove braces around single-statement if/else arms, wrap function
> calls that exceed the 100 column limit, and move trailing comments
> that pushed lines over the limit onto their own line above the
> statement they document.

...

> -				if (bBtHsOn) {
> -				} else {
> +				if (bBtHsOn)
> +					;
> +				else
>  					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
> -				}

You can use something like

if (!bBtHsOn)
	algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;

Thanks,
Bera
