Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D2E3B14A5
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267125; cv=none; b=dXN9nMecjQ//W6bYQGJRVwljJrBQ3NEEvVJ1u/HPQm6qZEuynibZcmYC1P+b+1bPfuV9Bq4t3p9Ld6RZFLmhNUPQiOXliEgYnoSnWpzEyPHp25KGmk3zMubJ0Dk70YYl73HZ/zWvpmwh1/muB/7oUX5gOOYXRlfTQmHljBuSu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267125; c=relaxed/simple;
	bh=FoHZTB9cnvppjq0kX629ApVhBBw1l7eB1Aok6qcffPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqYuRAEVpBBdaP0XlJH2x8eR2R9ildED2NvGB9YPnLfcEdnGHurPY9uo53EzRqobZ6Kp0jfSYKP5g20WnvGt6JtXczObIyhFyMNtVNs2TbN7tryhDbcCrmAUiLAPSfJrVgjmM1SaoWATqkGj4HbK0K0Wn/KUn6UwJaY6ZSQEZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu+07G+M; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu+07G+M"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so945962a12.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267121; x=1788871921; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ro4d/Tm6ZUdjMArZWZHciQyr6YK8EIE6H0sDY06CCw=;
        b=lu+07G+MDQHaYLq6mXbqYkrMIDPyK/ti0NYyWRabVVVg9U6J3eiDzj5BoPDiIcqNtC
         9xQFwpl+vYRD0ffFs8El6HwfykjMnVEEofLikXQ47lTkm/gociBdHLRTD59QShvhDTHu
         imF0IAybvcJviizI0DVn2bdIQRFblNWtqCMtHXlJw5hOfA6ad+nGSG2zcURA9yj8ehcc
         8LNCBQGPi9ffgLNKbgZ896pU3tJzoQeBHNq5QnbXQ1DqpqXPr4bsWCEdY1c7VUVU4wuV
         oIvIHbEQlXF3sveCsUce7ww91LsXbPAgWsertpUJUDMm1TFSDNSKuiTxHVHZzIxqxcgF
         reLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267121; x=1788871921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ro4d/Tm6ZUdjMArZWZHciQyr6YK8EIE6H0sDY06CCw=;
        b=dylZe6prxrBIvl8BsEgTnwjHzV37YTWzIxGf6dDd2bUw3dtp7x9L/VQqJCtLsSOges
         h0/yu9BHqsPiKj47GflmmHP+CfvwNqhnvlpeF5VeuOONTUXAhF3TNF5e/Z/C/l1JOibS
         gtrIhkqJF7UaIGSgkHUurQe4dD0T3Hj/9xIfX6ebAX486jVrdflZL0SDq4ZNGYIEJjQ3
         XyU9iaWWX0E07DeXW3OMi/DDrQOkwEVrL9pS/xYHr0fg1ReLnYLV5wE6ncWWjm1ulEde
         tjudiz5xp90Ze4FUM3owiDIgjmzeMklE9FChNfqnjch1i9aZlWio+WTfEzHCMzApMZFA
         Ei5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVFtsSdo9FX9aAVPaKhCOpQ4LvEXR6fxxc23KM+h7ceLv1912e8DzhpJW9q0mY16PgTv+jIJEpfW5qsBuZ@lists.linux.dev
X-Gm-Message-State: AFuF++mUqalqjg7XDzDhN27KLqTSrrpPsP0L0lqccTtl6kA2jnsrujaN
	2LO1G/mHsS/k75apzbtYAfw82v3hp8NFPdqeygFCD5BwTfpauGSStZ/A0qCkrFSQ
X-Gm-Gg: AYBFou2tCFzA88PnH6oAJF+SIKAvUO3K/RQyovhNZkDvqucUjF5GB9B/NBliZdbHePM
	X6Olkm/i/soIV0ig0x9AjqqdnlhznnSg32Amw+lTNOjEtxmr2dNVGAkkvv7eG35eb77/K7VLs6P
	Qy/rw+F/figrmNalkw8bWoisEz3UTL0XMFygU3jvLU0ScD6jnVkF0JZgGpWv8I40BBJwsp79xVd
	swX4WOzJUv0sGNBmQIcwl3EAmBpaj95s/Pov4WbSez2NcH3+4a2e650LWxqlnuXkfNd/hDnShQL
	ZkOizcCk/pzOEa6sRxBZuNvLHqm7X//5XVBNgG5PZJXSdGfZX4RpfzLrt9yCRLrMx+C4Hl0TFU7
	vu2qClltmOeC2csm4VjpoCtimHsezPzUrNbgjvXdyPco/kGQlK4IwL6jwEqS6mBFsSderTeeR5M
	0dvVFXT2/p3xN/hUlXGooyZKw24PBmchFKLvGWqqUxPiCZ5Ov5HzmcWhIiGWmhIyq77bekMuTbd
	AQWRQP6JKGG2jOo3TOiKRoBWg==
X-Received: by 2002:a05:6402:44d7:b0:6a3:87b7:b5a9 with SMTP id 4fb4d7f45d1cf-6a60d3b4e36mr16460049a12.12.1788267120995;
        Tue, 01 Sep 2026 05:52:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccb6c1csm684717a12.6.2026.09.01.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:52:00 -0700 (PDT)
Date: Tue, 1 Sep 2026 13:51:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mohit Mishra <mishraloopmohit@gmail.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Nikolay Kulikov <nikolayof23@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: convert swing index variables
 from u8 to int
Message-ID: <20260901135159.5417b6b5@pumpkin>
In-Reply-To: <2026090155-cruelness-plus-404c@gregkh>
References: <YOUR-ORIGINAL-MESSAGE-ID>
	<20260804170137.20708-1-mishraloopmohit@gmail.com>
	<2026090155-cruelness-plus-404c@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 11:43:11 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Aug 04, 2026 at 10:31:37PM +0530, Mohit Mishra wrote:
> > In ODM_TxPwrTrackSetPwr_8723B(), Final_OFDM_Swing_Index and
> > Final_CCK_Swing_Index are declared as u8. Using u8 for variables involved
> > in arithmetic calculations and lower-bound comparisons (<= 0) is unusual
> > and triggers static analysis warnings.  
> 
> What warnings?
> 
> > Convert both variables from u8 to int to clean up the variable types,
> > aligning with the TODO item to "convert any remaining unusual variable
> > types".  
> 
> u8 is NOT an unusual variable type at all.

Indeed, but doing arithmetic on u6 and u16 is likely to be less efficient
because the compiler has to mask the results (on pretty much all architectures
except x86 and m68k).
But that isn't the reason given.

David

> 
> thanks,
> 
> greg k-h
> 

