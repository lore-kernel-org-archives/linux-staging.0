Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E8B70818
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254174; cv=none; b=pt62ZLbgnvl5B6rsWwYATMIsnJ16zwG/iOkSpJj6TiTzijl9h3Bpsze1XcToRcFcZAoDLDRkP4myxy7TkoIEb0KDZychKzEZBWOF/Z9yY0rDfkE5p/1VYObXFf6Ti4wMQyoZll2KGyy6D6eU4qa4Qkz/KRTaDVDta67GK42Jprc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254174; c=relaxed/simple;
	bh=qYYsq92Ojc57hgVO74+L2yXQ4EAiDs12D5vlwd/Zhs8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hMVCO7FtiUB9qd2utydx0aZJ5DImnPaf4bWsVHxZYMzy/XOrAL1YMMU4fyoybkFraRh/N/jcoj7jaoCiblZbPzTB4LLUW7KqbHgkJpwQ2JMFElCS9y/s6ihVG+QVEbSEPjSobXVH4fKC5XceRiPdZDAMCNHSe+yOaCX/YjZrvtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc9yKZQQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc9yKZQQ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38de18126e7so3571751fa.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775254171; x=1775858971; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYYsq92Ojc57hgVO74+L2yXQ4EAiDs12D5vlwd/Zhs8=;
        b=kc9yKZQQiMrAlA8DBpCMM1kkTzdKNcpFmnXQmPEbfqz/qfDuNlE5dzcg2oXrZRZCZ2
         wUmzih8/TkfsSpIlhYoZGLsycUifoSHJtoSk70wekuNX5wJLqEguHF4qmXCgL0meAD1W
         5ranhvsfAK3cKnQ90/sNx5kFHWP8a1HI+Gkej7/gdSIUIuy22jgjpkNdBvvUfsoIvUX2
         fm/sNEL6rxGdSSV/7Osw40cTvM02gbvP98TxaK3SrwlP7+9lztpWU2sAzufIfhdr1246
         cVrqYdbYw+tAvCDTtQeGOnc2p82vLQOQ6jEPJ/rod8i4RZFvzH3jEFeIE1a7nLjW1kbY
         HKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775254171; x=1775858971;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYYsq92Ojc57hgVO74+L2yXQ4EAiDs12D5vlwd/Zhs8=;
        b=dM9xSnlHmYx+o9Zau5PzTUag2BglGoXG49C7yYw6RnXEn4EeC7qkLGJldK/AtQ3w0w
         bs93I0RxOQbUAQSLgPkAGucshJE540O/eFl38JbfZitSUQFvLdqyzG5v5r6JhY4SGsRw
         LFfJSXb4chdbgxPAS5BdKM/agFPiY0tjM/jMWz6i9qg4AVKJB4UO2HZcPnOHMIhNFi1h
         fUGnJAradYcTPMUh8Ysg7mse4yOtOpJIHka1SskvCjRqQdCk53z2XNRoSOrp3G0fx/tL
         YEvzw/K0g9weiyqF978XaGR8EmFmsPwtIR4vNi53QLML8B28KqtjmVsKwlupLQ2cBbiS
         hBVw==
X-Gm-Message-State: AOJu0YwLHpv6QFunApMFiz1OiSWbao+TyQz2KNufGYgjcOPCuXdzTCwz
	r65aMBAxS1IgPYeXFy9O1Bayc8KIg2QFOnOCyYrcBDTIctv0lIk02Q5942K5DTLg
X-Gm-Gg: AeBDiesPBQm/ZueTHY26iNehwIZ/ivCl0qMhda6KylY6lcQZ2vYnPIV+tF1hMLz1znt
	Udyl3/7hVEZ7v9Wz1Ml8+1i2JdLoVgW5B1sX+dRvycrlbTNR8uPxR+hRZ5YfU4U3GXCtu8yk+1x
	vdi/PGR9oRKqkPupuZENuMh7J5B1fkDek7p7q/lLyttweCl+M12Pn5Ii0tm++j+BXHZXfhrBWfI
	vOyt26dABn72aiN947L1lBJ1FIr+yDt/dP1cnIBMArUVoShMJAPuZq0wbKnXSA+ybU7Wp4cPdoj
	UPeLGEw1Po1XOU/RPQV+XyzZXJS+PLY6CMWfcGY5FzERJdjDf7xzzYPluAHywStMfv0v7foF24l
	ObUGetZ7xznFlMAM01gT372omojOSgFjgARODB1Jhii5J5+B9aUqFtTTJidDYSZVBhag+K7tCQl
	b+CRFavvYmJ44NeQfFY1CPba/A9HdlPFmcbCFrePxiV2XDd4gtYprV
X-Received: by 2002:a05:6512:1110:b0:5a1:3da4:e92f with SMTP id 2adb3069b0e04-5a3375929d5mr1599257e87.43.1775254170273;
        Fri, 03 Apr 2026 15:09:30 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd4e10sm1724384e87.80.2026.04.03.15.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 15:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 00:09:26 +0200
Message-Id: <DHJV2X9P1XP8.2L6P5A8Y7G3EC@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] staging: rtl8723bs: rename EFUSE_Read1Byte() to
 rtw_efuse_read_1_byte()
From: "Linus Probert" <linus.probert@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Linus Probert"
 <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402054215.271981-1-linus.probert@gmail.com>
 <20260402054215.271981-4-linus.probert@gmail.com>
 <DHJUFTYOW0C9.1KG9RVHIZID46@gmail.com>
In-Reply-To: <DHJUFTYOW0C9.1KG9RVHIZID46@gmail.com>

On Fri Apr 3, 2026 at 11:39 PM CEST, Ethan Tidmore wrote:
> On Thu Apr 2, 2026 at 12:42 AM CDT, Linus Probert wrote:
>> Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
>> kernel code styl.
>
> I missed that you misspelt style in my last review. Sorry about that.
> Also, its generally wanted that you include the change logs in the
> actual patches themselves.

No worries. I'll fix and also include all the v0-v6 history in the
individual patches.

I had one question. If you have provided feedback on a
patchset. Should I include you in the 'too' or just stick to whatever
get_maintainer.pl spits out? Can't recall reading about any general MO
regarding this.

Br,
Linus
