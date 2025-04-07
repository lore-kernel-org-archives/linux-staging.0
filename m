Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE814A4C6;
	Mon,  7 Apr 2025 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028484; cv=none; b=hU+cIxQAKMyPHSVxTySbSaHqLwSc818EIVJ4pyYGvixPYr5E0w7DSNcmLWWtRMHfLs3TfEAH0Ci55y1jlFBYmdyjzkgjCWwL/kGoiTha5ffWLFc1YYSQxBgyFD4UIwHDwOMZt6f7foZ1sGx10u4z685Pr+4SdwoDUm5rPWZBBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028484; c=relaxed/simple;
	bh=dXDqJcnrYdDQC2YiFBN/WStaW5lex6NUThZVJBzqIns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CiKim9o3rTZZyLHDhHGfXkiAzKwPgwlSrcmo9wZPDdlSuxa6rHffAFmoGyQeIHLcou7C1D1Xd5PMhrmyDYLloQWoK/gkrU1e6CqNqhhl6b1YCLyx/5as0vYyoh4cqA4Kkwb02Vs5l551ytvOwaTLq7zYLQX7AHerXXFHg4EI3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUS3sgv+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUS3sgv+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so28350635e9.1;
        Mon, 07 Apr 2025 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028481; x=1744633281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk7RPcv+2R4YAv/tAF8Qdd1Qu0WpDKQeLpxo+ejMbqY=;
        b=QUS3sgv+s12XjoNOgLzC/HTDO2rNHQQYnQKlPVqmllPq5pmw556q4G8CcKaetXDR50
         3tBFdY0xfx4ASPEYmVGkVUHlsocUl4wpHKTITpG781g4czVZbRZOuWXypWoAVcWLDzs/
         wa4AJ38NuA58ZMPKWxk+FrnvsEJq10mgwv68xDbHgdWeMK9oLqK+SbXeP9eByEqxM6kj
         Kcqv86eLP+5nAzGhFDXoBiTgCpdknROMOOQE1maVNiCfAXNPgWSiWXzOSmtlfVwTKmiL
         C1sizu/JqtRmppY6FnIll42jXCJCn/qQ2PHpFEpj8AKWphOFUbehzVHvZfrPTKkFjnC8
         ZU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028481; x=1744633281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk7RPcv+2R4YAv/tAF8Qdd1Qu0WpDKQeLpxo+ejMbqY=;
        b=jMRLRUg+LQyFkU71VR2al90FSag0o7+28NaJT1zIUt32ROOjMjCJuzv3ww9mFppJSz
         wPLb8Nhj2mSo/N0XlejKNFkI5LZz0QKel3aDVg0KVhI4MwQLPM+D5ZoUWHthA8hs2QI1
         DRxWKxg/Z9S4t0hpbAtPkDz5rYsqhDBAyczaKILuaQIAJdpbrbQQLtFiyk9IaA6WbkaQ
         28p0bQqjDqfTr98O+UnxGR122rUIjQo5lRLhKON0KuDdeKlxKUcrrQK8po1ZCN5n3wjH
         bpM9H23G0QijsE6ZQ+ssKY73XQNZD5NuYZVouFdS3Y7Vyj8DCDydqJ317xrEqvyi0kQA
         0Aww==
X-Forwarded-Encrypted: i=1; AJvYcCVvOjz/rZzqdJZOkGWWcXw0+WmLEt0pKjIWBMseScMadboxTe8g+yJJ/g17Uh91KZ89Zy3EvvHpMnmr@lists.linux.dev, AJvYcCWUUY1AC2CpGFlKyFFX1M38wvaXakardyLQbHGpYwnHPBpcgJPQ+o4GD8BpqeFrLsgTlwgYM4epEi69q4/l@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5xPV6uD8FkdmpQCjZzswGWwI4yGCUcph8cvOEaSnEVlPq0/oQ
	WH8b02uaBM/adUVhEBW8+NC/KHYMjuGGhhQjilKnyORP7FIYN4eJ
X-Gm-Gg: ASbGnctVoo8fNdXWRBr1A69pvZe52+xn4c/vPYY/UA1KxpQPWZPs9qGVvBjeeidbV2U
	uHYooCPIWD/wtedecf9ePS9qn/UqhfGeoPkJs44j7IBc0MjPkBOyu5qz6zB+CWpM5wJmPja5yEt
	kRziCeNFQEXUSaokMwNXGhU766BXgbJotMaSJZyt4b0EFejAGIvlN5uuqoyKqDFKGDET98I6aCy
	Yd+FZtlNKWQ5S1OBw9IsAn/abPWX24x1Zp/Bct4j54RBlm3UVCjUQsQnJAb4AQP/dYHWdSnqx1e
	rwI7DM/3huE8x9F56eNq7JeZ9rPR5MbA2IaUmiBMeC9ICUZtq+aodcEozTiyn2uIakDnO7j3rIN
	Hioanyrs=
X-Google-Smtp-Source: AGHT+IHYLR1EDZrWvod38pShwJcb9XIwrEvM/Ff6ZkWw6dYwPM+i0rz878gr+CGs8FOEgXf2AGrR7Q==
X-Received: by 2002:a05:6000:420f:b0:39c:30fb:fd97 with SMTP id ffacd0b85a97d-39d07ad8accmr9499023f8f.1.1744028480684;
        Mon, 07 Apr 2025 05:21:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm12034152f8f.74.2025.04.07.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:21:20 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:21:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 julia.lawall@inria.fr, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, andy@kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <20250407132115.11ded3d9@pumpkin>
In-Reply-To: <2025040752-unrefined-labored-8c8c@gregkh>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
	<2025040757-clergyman-finalist-0c63@gregkh>
	<2025040752-unrefined-labored-8c8c@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Apr 2025 08:53:30 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:  
> > > The sequence number is constrained to a range of [0, 4095], which
> > > is a total of 4096 values. The bitmask operation using `0xfff` is
> > > used to perform this wrap-around. While this is functionally correct,
> > > it obscures the intended semantic of a 4096-based wrap.
> > > 
> > > Using a modulo operation with `4096u` makes the wrap-around logic  
> > 
> > <snip>
> >   
> > > -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> > > +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;  
> > 
> > I do not see a modulo operation here, only another & operation.
> >   
> > >  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> > >  
> > >  				SetSeqNum(hdr, pattrib->seqnum);
> > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
> > >  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> > >  						pattrib->ampdu_en = false;/* AGG BK */
> > >  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> > > -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;  
> > 
> > This also looks odd, nothing is being "AND" here, it's an address value
> > being set (and an odd one at that, but that's another issue...)  
> 
> Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> the lack of spaces here threw me.

It is still wrong '& 0xfff' => '% 4096u'.
But it is all rather pointless especially if you can't test it.

Plausibly more useful would be to find ALL of the uses of 0xfff/4096 (I suspect
there is an array lurking somewhere) and change them to use the same constant.
But you need to be able to test the changes - or at least discover that
they make absolutely no difference to the generated object code.

	David

> 
> thanks,
> 
> greg k-h

