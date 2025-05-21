Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D21230BC3
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 05:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806100; cv=none; b=jeiqvSRWv9ZwNn5dq4zOHFkJj1Op26wCastQbI/JodXCuf3PXLFC4A/ZbcPWsp1ofQzSiH/UcWwY1EJl90/D7JaIEStjP547YOFf+d2HuMXTxPBIKx112FqZbw0nl47shcaAhHgs88rgv4WxnY/YCasclFLWjWJulxqNIDe+sew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806100; c=relaxed/simple;
	bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjPVbYifHunouVSjUGyK5hKWkV3NT1MPJNYbduI9jwdky2YVbWLwIwmhIBbiRrZ17qEobgWCXMN/N2OBHYKJG5WYFIbwhYIfiUzrrkHRFj1GLxf7lYzOTUQfnA8CtN+9IGIzzGQIxeMVEJt9VaB8+NFembgM7deDWGgbIavftwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyVj6LWU; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyVj6LWU"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-708d90aa8f9so60699607b3.3
        for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 22:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747806098; x=1748410898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
        b=MyVj6LWU5iWdX7zo/qyEsW4jHM/6ASH28KUjwxmdcs5gyMvCq1DKCillQr1qDFq/6t
         sXHBo6eDwBURPUCAi9Q7aWJJAOzwNBloUKyghTq8ujg/aaGywd1cJYBXCRHsav2BdtsB
         UTc3S91sjpICggrxeOwjm05vJEgM0pwx2VtCF8jfH9vQz04RS1hcPA8g8ulfxYEh6spn
         dOoYosxoRUiudhj1QLf6IDclgPqjgfT5TAy6TPeVx4UPAb3PaEf2b3QcGuFdukVhyfxA
         LYy9oeO4FIrPCU0khjIh20rEIc+gA/nxY1LbnVQxgtP37tt36De8YMAWtyLDsRTctWuo
         ULyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806098; x=1748410898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
        b=HulFUlfRnVPCBwCBYlsPC9ZR4h36R3kpGaw2H7XfKYGsXf14gHsMvhK8LqcHTd9LZq
         sqWUz7Enmcfg1yndFZbnQRqEhI1vy1CmMxuEVJsG8ojBLdZFGqe3eH3V+126y3nPnFf/
         hqrHBHqOZDAOa55veqkVDrkRAASj62H81iZVUvupsewgnFO2Pij62eXe3HZFdleGSBL6
         HIdkA54Bx2rf97Q9z0SYm1t54Vpu7X4phioeljQXcLr9j7DYanWEHt0SMnEJwdUjGoSx
         z8Dq+6TXfUotyd81/cB8JJbIf7WSvThIC2deHAmJrFOlQFV9yEcXS2IGVzNm1Ij40/iM
         QL5g==
X-Forwarded-Encrypted: i=1; AJvYcCX7TRD5JNpR4gcvdBSvdVNCh3VI5MSXwGbqAKPNFElSFjbsAMwANpZ9iVTDGC7SF2mbO/4XdYcq9b7EdpXU@lists.linux.dev
X-Gm-Message-State: AOJu0YyC8DEtkGmws322gBXErTwjJVWjOM+jCFwuivetGWrzNK/0hMEo
	GvrVo1ZdV/tILBju2vpJf3WhzTcPZ+vB8NPa5uGndCcrNKgpgFHM68mW28Mp4AcBKzFHm81CvLZ
	EShM+82qYgzTyTH14uRtPZD7Gec3O9iM=
X-Gm-Gg: ASbGncstILn2vODBpN88/diEhaKtIqx8pAottRQjToErMpXPrbH3upi7NrouajkIlCZ
	LX538+uXPBJAi35rMWSGalrtgdpOcH22sqT4ggAgNrGmbsbqdNNVKzTH7Y0bhihBlUUtrL00R7a
	Px4WMRXqn9N1htQtavMaJDg/8dCzH1EcySQg8NaI6U51STtD+gHY0H5GtTTGAN59ka
X-Google-Smtp-Source: AGHT+IGdSZe7ylfgOWcxywNa73o7coZc7jyagjAA4TlJYJVRxstnsjYUscSako9JGhA3ho960/y7DVvylMCCgAFPLnM=
X-Received: by 2002:a05:690c:4981:b0:70c:b882:2e5 with SMTP id
 00721157ae682-70cb88204d7mr223289207b3.2.1747806098307; Tue, 20 May 2025
 22:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
 <2025052116-diaphragm-payback-a3ef@gregkh>
In-Reply-To: <2025052116-diaphragm-payback-a3ef@gregkh>
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 11:11:26 +0530
X-Gm-Features: AX0GCFvPSzModwUdGmboKsJgQOYx09zLVKlfPKnab7JQIOmFxYmkMhIanR6ZZLk
Message-ID: <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi greg,

why is this a RESEND ?:

>> I had sent the same patch 4 days ago and didn't get any reply , hence tr=
ied to resend the same patch for the same,
here is earlier mail :
https://mail.google.com/mail/u/1/?ik=3Df63b03515e&view=3Dom&permmsgid=3Dmsg=
-a:s:12290863930259651721
,

line does not match this:
>> sorry , i could not get it what it is exactly ?, if possible can you sha=
re some insights or example so that from in future i would get it right.

thank you,
rujra bhatt



On Wed, May 21, 2025 at 11:00=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Wed, May 21, 2025 at 10:26:52AM +0530, rujra wrote:
> > To ensure that the firmware tag is properly null-terminated. When
> > copying firmware tag strings to prevent buffer overflows and ensure
> > data integrity.
> >
> >
> > changes has been made in 3 positions:
> > 1: update firmware tag
> > 2: backend update firmware tag
> > 3: backend update firmware tag with unipro
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
> Your From: line does not match this :(
>
> Also, why is this a "RESEND"?
>
> thanks,
>
> greg k-h
