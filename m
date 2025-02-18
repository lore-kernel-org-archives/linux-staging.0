Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870A24061E
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879814; cv=none; b=TAmSM5xZLkvy6/zU4h6g4/ETwvU3kxNYet0p6KOmlIMu1RGpXRu3FTx0Z6e4UITIm1J4FqD4ymQnHh3VAC+46y4bPsqbHmgKj8A+f9qeM2JZ5oTe9tBvxBi+RN8PXrurtdoOjas4hhAxmM63cvqMyVV+4YmsoEI4HBtOrTXZkEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879814; c=relaxed/simple;
	bh=YSuUZpQwyI1ReUjchWfaRa5IbfoeOSrqhxxtaNLXXTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiLyvDZu01vXu59MsX7H+pXCoUpg5nirakv+Jn/ZB8RDaBtohzKUzCtfYre5Jh80BBg9gw0unE/61qTy7igjZKLREq7PVYofaUV0Bcr1yrJ3SMc1gHqyb1Dv+v1BDmcpbVdv8Rhu5uTWl4A1fNj9HfcAxJHlVboMb8VxMWMsbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh9V+8GN; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh9V+8GN"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220c8eb195aso109403805ad.0
        for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 03:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879813; x=1740484613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEcQ5QKcDeRXJqSlbMneaKm0YQCQPfq9RtB35jSUmKw=;
        b=Hh9V+8GNNVv07YRdKeNUC9hkG08E/D8z7O/TVHOE3NaUhhSiVmaRKGBbddTX1B9WCb
         EYx4H35goVOJCbpjBSwKYeji8DLF2Sn+l0RdXE/rtqZh0UmooMjTgYNy8aqQ/BrG3QIf
         ZpQEZ+p25lde2gwwdHYJ3zbLN3mn2sY0j/zbSXYAYjpPoXGHqyFnPlYt7TyG2ISQcX33
         qyTP6fhxaNAUpm0i4W3Bh5gKhand/nTrpnMXzUj2tXz+odB5vObdNmT4fTxUbtUdwLUB
         qZlrWvhOP2MXRepmjYNmEdNguStjyQe71jZbskJ1iysKglo+buQYamf9ntLTP381RD6T
         Vn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879813; x=1740484613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEcQ5QKcDeRXJqSlbMneaKm0YQCQPfq9RtB35jSUmKw=;
        b=eutCJGkalduWEdsoBqFw+xT9sbKQJYn1cDa9g0R6punC3wmH6upebLFXzMNeBKTmy2
         WazNL9mTUFf0+CJrERiJz+eu934tULVaCsz3kJzL4uLZlVdF+a1EV9DzorLTnuHwk7No
         MEDOiRf8hX+dx0bDm9r2Ec4NAAbH3CFP7gY8OtpqIr0hSkNY5Wm0iOyXVZwxYV1sBbDF
         uk86qwczqR5A6cK8g2ltfuaMLccbMoau/PmOhfyXCaJlwq6ZCFOUfsDGoKh6Au3Ho4rt
         jrLj18RGzl7SmJ/gZEc+yWJYR8REXF4sNs072g3TQiaMISuxpKZMkxW3qPt6pgn86wbN
         DJsw==
X-Forwarded-Encrypted: i=1; AJvYcCWIDsDDa7M3Lk95ltX4dkFJb3xCdllNBNxDUXbZJR+cNrCIVrKO+ipl4m6xKDph3pyUamxaBawQ7w48Ffd8@lists.linux.dev
X-Gm-Message-State: AOJu0YyDaOK5+DDfVmJXTkqhwuWRburyblkFHHkh6tGw8E+Pabvkc96f
	wumo9SalgGicXvcUJfXT0/NfWv/3Cn9dGReNeZ8H0sfTWuKfAs3q
X-Gm-Gg: ASbGncu9x5H9GWED/y75mSh6scGzN1OCLDei76zsmQIoefOQnMswrdLxS5AEAktH2xq
	z+sxbAZTsI9HUNic9KCD3zPi3OAPBgYeS2NLR1WVACKHOLQ5rHW77kvJfIuIzZLzQZ8kHsfV1Zx
	nqDyq/2sOagnlakSj+je5UhqmdpR/RmrEgKx+L68ebUVEolDIKgjsOdA0mwRL87ie7mwti9Gntf
	KPg5LmtDrvzLSU0c/Zgw9BDguUdTVNcGg6yW79bcPOVSlkMUeHvF23JPblw9rrtNHEKRuChlNU4
	BACA9IgHRu6AUS/W4Q==
X-Google-Smtp-Source: AGHT+IF+i9vVTezwqpuU0zG15ZQETlIR5XLCm7azHuYbXnQE3irufSx6ulB6QadTw3IFnEI0XB92Wg==
X-Received: by 2002:a05:6a21:483:b0:1ee:62e4:78c7 with SMTP id adf61e73a8af0-1ee8cad2d0emr21871835637.16.1739879812484;
        Tue, 18 Feb 2025 03:56:52 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1058:835d:65e7:a3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-732658987f0sm6550439b3a.10.2025.02.18.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:56:52 -0800 (PST)
Date: Tue, 18 Feb 2025 17:26:48 +0530
From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
	rmk+kernel@armlinux.org.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] staging:gpib: typo fix and cleam up
Message-ID: <Z7R1gKOcN5FdxUxS@pronto>
References: <20250217195050.117167-1-kumarkairiravi@gmail.com>
 <4b1bf65d-bd16-495f-abb5-3d59b65a59a5@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b1bf65d-bd16-495f-abb5-3d59b65a59a5@stanley.mountain>

On Tue, Feb 18, 2025 at 10:48:03AM +0300, Dan Carpenter wrote:
> On Tue, Feb 18, 2025 at 01:20:47AM +0530, Ravi Kumar kairi wrote:
> > From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> > 
> > minor typo fix and cleanup
> > 
> > Ravi Kumar Kairi (3):
> >   staging:gpib:agilent_82350b.c: fixed a typo
> >   staging:gpib:agilent_82350b.c: cleaned commented out code
> >   staging:gpib:agilent_82350b.c: removed braces from a single if
> >     statement
> 
> Thanks.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter
> 
hi, thanks for the review and would you also mind checking out 
[1] https://lore.kernel.org/linux-staging/eb8368ee9fff0076ea1f97d154ff2b07d2fec572.1739794938.git.kumarkairiravi@gmail.com/T/#u
In case it was marked as spam by gmail please let me know so I can send
resend.

regrads. 
Ravi
