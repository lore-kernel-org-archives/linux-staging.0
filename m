Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B62904
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040999; cv=none; b=Ro/qkSl3xIxOPvUIHZwBMTDqxqSZOe73SItFFw8lEASEHliZOr1hGCqK7oW5dSi8OTeoM87LiyFTxaBZk8rGUPvjlOARvC1bx9mfaeSi8Du03Fv6PvcJ75G8i86CeS57vTbPbCH+hiEDH4aRxy00RaAp1xWS7hzo8MKe2TMRIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040999; c=relaxed/simple;
	bh=5BCZIdNRkhUIBdY64OeUY7sVGNbJ/g40WgIHT6thUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfiAbblE7EyWYOwA2MwFSPNwclzVmAi+WMgkELdisXwNf0FIAWHU5In99It75u5lLGHe+RaUlrYb8cXEkLRbyfcWd78x/h7ojpSnmQ9TFW77XI/oaDgnpQ5ThucH9ox9UqpLn3/yNjcB6yj11qlBtdDWyuFuyuKLkO3yP+mG4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sn39G+04; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sn39G+04"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-736f9e352cbso26462a34.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751040996; x=1751645796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=Sn39G+04dmHq1w6CG9xna0IfKCFd/XqjrOBj529ASMW1fctrZlUvsJ11unlIibAami
         p4gJehM/0rIsybVO/I0supsFv3wjNx+n754BTDiOw7vAVpP+B0mctVn0BnEQ4EK86S5M
         NyLjlOz2zmkjn0JgSU5ZMg2vaHPGUX5ZgmhKif71CZ3tXy89qAh6hZXttHv4OPxntztb
         EC9uXOqeeGa4Ho+jchyHS8RFRzgCcMyCd/dmuUSDr4bIgZ1cpZYmyuLQ8mzWAtIc9zyQ
         6cNqLwpicKW0iow/P2cWxqej2bEyzHciLqYSPprLX062pIMsvBzARizAdmfh9MCG0eej
         3w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040996; x=1751645796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=ScFX3Mv1ehzeXTZIgf/9jACW216NWMgfRq7momn5vFS4CtDlAbuAaei/zFg6WO9rjw
         n+KReJN2wc4cIBzoSmAPGi5u+aOACgPCzs+sFXcaag9dDABSV0iUa0gqevCTFJnsVk+9
         QZqnwsyGtD4+bV3nKk1cLVcE6I1eeBuHump41s2g4hHDeGxFNr/dBtuRbquPTnCbdpyd
         Iyc8V4JTg+W6WIuo+EVHW0G4qxZg+bPLe/sKzoK6m54PnVq47NIj8/tIYDNxIe234mh5
         BZhHGJA59CkjDA5fnQsYUV4662JugIeXLx9LaydepUxkOTypBTQ/zlvHRBdcLJsYVAXY
         L9wA==
X-Forwarded-Encrypted: i=1; AJvYcCUYHthS4w/gHB0ywJhhattG+48XFf0Qq6aTlWj8Sk+9fdOM2iVM+rNnoGkv0Rsm15sRNfKAgo16kozhYFPf@lists.linux.dev
X-Gm-Message-State: AOJu0YxCP1bxZv2muZC2iRsNedCyuAz5jN4zRp1cKxW4KlzC08a2PXGH
	OUxGdgzyIZ1hUxhUXRJKHSF0qEHknWy34+AsCJslOtdXYdLOXiNK8ArWMYAqo8jAY/Q=
X-Gm-Gg: ASbGncs0k8TB6dgcYJD11AM7VvjLHnneO22gDXTtX2nRYlRMMQuxFEWyWsN+QbJ4Vw+
	umkIz7DSF6kWBjEGXDbRDKFE7ePALmtGxcREA0FEAxYHHAo8bEenaSrZkM+j/RAckSPx/BsooIy
	xuPrHfJqckXfwzJcp5/ZK6qqIv45yan0U6RLPiSFNBDzuqQCSN0HT6I0Ba3OAduQakKCdmG7zwP
	yeF3+Roc2QWV+l1/ADP5uCvvPOIJbAsarhFBNzOT4fNtsLhuzLjr2jPLnguNM1prtKQSET9bpx1
	I4SroSPGmduf6ev5/NK6FR0WDqbnvBbksTEAXSY0VFjyywdWOVj98zQcaJKyxX1YMEv13Q==
X-Google-Smtp-Source: AGHT+IHSu+h2Kzxlf1fk0VB81UI24jyMyrVK0+P5Y1H7EQ3VQt8CFFGwqHkfpVATJdlBq2OYHofbSQ==
X-Received: by 2002:a05:6830:4d87:b0:727:3f3e:53bb with SMTP id 46e09a7af769-73afc600f17mr2265204a34.24.1751040996481;
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e2ed7sm406749a34.35.2025.06.27.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Date: Fri, 27 Jun 2025 19:16:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <0256dbd4-a08d-4549-a520-63ee88eb3c1f@suswa.mountain>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>

Heh.  No.  This patch is way way way to giant.  It's 80 thousand lines
long.  Anything longer than a few hundred lines is probably suspect.

regards,
dan carpenter

