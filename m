Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4837D10F
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464398; cv=none; b=cmxiVb9X+hbIkDrYc5QdBdwSrTSG/mFF5AsHSUmQU7tcE+PGXb3MBR3foAKaiIrCQiYcXeUiS55Uax45Fk3T8Ma8MD7BbRIptOBLHLN1kIc/laZghvDS85NvCFcyHcjv6RjUBJ9p1m22Q4w0az1aQ98WDpp/CfSJLCt1fg2akuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464398; c=relaxed/simple;
	bh=lu/HKzE/lq2G71nT0injQQr3KyjKe8X50ScX5vY0rPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7HODFxjQTpT19rVbcTeKS+RpLmyfxOMaQP0e7cC6MEY1fxmTWAgPx6iUiR8AU61FDlAM8YoZdHDVToSJL4pqz8UeTWc4HuIwWOerlTryFLrYuIchjIX3j3lEEgxuMwgAu4yIgu1T/XlE5r311dFLUfZ29Uaaqucfv1gxu8aok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcgG3Jrq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcgG3Jrq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so151675165e9.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777464396; x=1778069196; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i92lzohDjsh3NY9nKaFXQJteZVFhTZTO2i0PlWpQq04=;
        b=qcgG3Jrq87mw6Fh68xmfUPfG/W/yjGxJhwGixtlI7WEimIm4DpawrLHIHJnfvUGRN9
         s1A8CyYGsvvHGun7wWTkW/bj73fpySE9ZAz0GVeaF5C7AmoTGgQ0SD2Hlce7lVHki0HI
         UmAeFjnScwMZPYzCHCYsofqNOCE/8OnrB8owpiMmeQJ98ELNMVDQioyCKuz7ZT2VLrEv
         QDsOXaCAi1kozVAxzUUhoNQ6LtUcw7XffIYf1Xp+JA6BvGzQA0tk/3P7xdgaAlO8+9Z9
         0UyhhhNNV37d17nlnqb5DBunDY4G6bAFAZIcKusOD2nH7h4yn+y9YfOrnnOJCEpzseK0
         UX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464396; x=1778069196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i92lzohDjsh3NY9nKaFXQJteZVFhTZTO2i0PlWpQq04=;
        b=hbpd4ZrwlSRbuQ5PgU8+B2IBXyJ9IBkGqzAwDdfobjrKHWFuzFvY1fpa+bnhElgJTf
         r6Uhs3jmeFg0L6RRu/H6L7wD87Pmhz60rQ0019Fk09wwOqdCRy/0nvy4CHMTM8BAvfzx
         ruv0Tmg4D8MFk+AL7Kj20d8zDZsto+f9P4oeD3nsRy4esqrFsk52qrrzmSTah6KZrWJj
         yCq9zZPqOgzVzlpdCjQ5ougefTPgNjwltGOIg+VEUABmle4zveBPdMWx9kCJdumsDXRQ
         Bkpm6INtrEyM7VyXT3qPCTJe5FPG7fRWLXwtz6MltzOw1m94TlIhMrVoU9VvWyDDnNEK
         sUbA==
X-Forwarded-Encrypted: i=1; AFNElJ+HpOpWvNRi+oj0RLKa5E16gP8jGZ4G42TGbbeKpZ8F+3mGx+r44y7THoASKUX0o0PyWxcEfDNp/A1liCs9@lists.linux.dev
X-Gm-Message-State: AOJu0YyBIPuQGgA71QlhbPFrqJ4TqRYGVWV/aKcdQQSKJTRb+slshwcn
	umNgLjcjCNxWFVo53wZkVW2/HkPnmJeZhBN3J80aw7FrIfmpYidJ0RNs
X-Gm-Gg: AeBDievQidvyCi/LaV/xI1w4Xdw5VzUDSfQiDvPhVd8REzEbxOcSD/1cDxYQW0lYXMU
	bD3oHswDNH+HDMyAkzsafVoxPPqXhf34vYwK8xGuwfsQrU8BXgE0X/nY3HNmK0BroO6ptcz5oaR
	WRzjoVao7TIsGvx6hYsHzYRIaeqTFxw2uYCs/v0AgVunADcRU8/Jn4LMqkVb2H32YXft88g2MKG
	YSVnIprpKaR9udOL4jD4Vj/F27OBNx7aX9E9X2R9ObW4H56+PvqYmN0YzR5Dd7ZqmD4MuIkI/Lk
	afZ7JYp2PGdo491Q04yujBL/A2fKWRIuYWGiw/TeqOMKZXRtb5FBkySni/hQgBgmi4qLXQbusvF
	Cb6fjsh/yvuq3d7qzygG2ScaA5B8OdW/FHKph109k+/4islV/+OA5NONZejul70nzMifBI+lzoa
	1W6shbkrm55G2gO9i4tiPZjpa6uKdJ3sXuRdDxYsb8
X-Received: by 2002:a05:600c:8208:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-48a77ad5f64mr112046495e9.4.1777464395333;
        Wed, 29 Apr 2026 05:06:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc79ab4sm55335745e9.9.2026.04.29.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:06:34 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:06:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Linus Probert <linus.probert@gmail.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
Message-ID: <afH0RlRIDQdC08dV@stanley.mountain>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
 <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev>
 <177745958799.1254637.4289009650997698120.b4-reply@b4>
 <FD718F1D-8156-4E27-BEE7-23E66D045A2E@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FD718F1D-8156-4E27-BEE7-23E66D045A2E@linux.dev>

On Wed, Apr 29, 2026 at 01:34:41PM +0200, Luka Gejak wrote:
> On April 29, 2026 12:46:27 PM GMT+02:00, Linus Probert <linus.probert@gmail.com> wrote:
> >On 2026-04-29 12:24:53+02:00, Luka Gejak wrote:
> >> On April 29, 2026 12:18:12 PM GMT+02:00, Luka Gejak <luka.gejak@linux.dev> wrote:
> >> 
> >> >> This series eliminates all remaining checkpatch warnings in
> >> >
> >> >LGTM, so for the patch series:
> >> >
> >> >Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> >> >
> >> >Best regards,
> >> >Luka Gejak
> >> 
> >> One note:
> >> For the future cleanup series, feel free to squash identical logical 
> >> changes into a single patch to keep the commit history concise. It's 
> >> up to Greg if he wants v2 but logic is sound as is.
> >> Best regards,
> >> Luka Gejak
> >
> >I will make a note of that. In this case what do you consider an
> >identical logical change? What would you suggest that I squash?
> >
> >Br,
> >Linus
> >
> 
> A logical change refers to the type of cleanup being done. In your 
> series, patches 3-8 all do the exact same thing: fix CamelCase names 
> for functions defined in rtw_btcoex.h. Instead of 6 separate commits, 
> those could be squashed into a single patch. But as I already said it 
> is up to Greg if he wants v2 or if he wants to keep v1 as is. Either 
> way code itself is good.

Greg has said in the past he prefers them all as separate changes the
way this patchset does it.  He recently asked somone to split up a
typedef patch into one typedef per patch.

regards,
dan carpenter

