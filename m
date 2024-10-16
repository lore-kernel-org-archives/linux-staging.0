Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDB1C0DF0
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064461; cv=none; b=quCvnbZLCdXuliSMX+We7w67AAi84fLBq3Psiwq6WBCoeG1rbVRM7YGZFwa2H9fM//wefcUXK7gI/aUm9Hqcc5OLOBdNesIgOKeHKjQD8CubyDCMibcMqSgvXjtr4enOAb4FgtWxlttqA/25cN3O42PRMPJv+oyeD5oy7Y4fAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064461; c=relaxed/simple;
	bh=cJqezZ//VWL04ujmf8HWK5yYC5mIb/17KND/yhYfcug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDmo81zk9hIivjIiAidZjxtyJ8DAdQ+k6vEambenqh2Ovra1S2Sz4OQqtW/g2eJNxopGWAzkzzx2AYEFczfDzE38T32tSFSdptNaLqYRPVhXIi1qLQQp3oXWFfVjhILi/gWCCPnqceKGKKM/Xw9INHcJYQMl1AAvbpRDr8db4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=wWI3aYpo; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="wWI3aYpo"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a3da96a8aso54333166b.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729064458; x=1729669258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMVFl2GTcBmobaI+bMD3OiVaYIUMWW+lDjeTxVFsk50=;
        b=wWI3aYpoQoebENJQQMrXGE+i4wXbJyLMF5xzUmlt/N6XBvR/iGIBCSm+MkbHt2MU4L
         5OER4bhXACXjpPYvmzVCcw7f41Ub1R6cy+EOblUk4HVdMGps6CGoG0hLJJQBCfzXZh7O
         /yYobpZ28zUBP8osXRKkLZoLAuWQbVH/k14Z1m2TWXrl65Em15HIO75FSUZRUQjLV0I4
         4YQxC5aMA6KkRCWpa8xG/krU5PVYBkBQrhlGqQjtlegfM3gUsDdkLCTSO/fEsJjHER7F
         nnyOuwgNGTKxgrJBHU+LsiJOfKna5J9TNmxJvbFszNZFHSgls4VyRALOELI9o3b7wat6
         q1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064458; x=1729669258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMVFl2GTcBmobaI+bMD3OiVaYIUMWW+lDjeTxVFsk50=;
        b=QLHFiFCmkMX1NCimkOToLbc78FgtbI+r9HQlxpHUKXhTuOqu4M6T4LoxmeBu/Sd9r3
         sgMAWNyM+rPNvG7JoRUHI6I0MtB2WPbt6QIwtZnGBBDU1728/f9GDJ+IM89P70IUvxwd
         zRbnnCVCTtXVDQPOxSwUZr0PDnPDEWj0PRUa37mV+W4Ir7+DLew3U+23vhHgQFoFO7ny
         iu78g4T+fAHznQOeCawwO6qusNOf68xbPA06mwHv1zs+phg0gZW2OEv7sORqhYl/MJg9
         h1R0BCbM1aQBKMeBEWF2W6ke2vgh/I+ZBRzjgcBQtKGpT04F1fqy7y1Zu/zh6SJ7UVbR
         GELA==
X-Forwarded-Encrypted: i=1; AJvYcCVTVUn9HMZRrljsGZmfUiDdymiQ+qNk8GFbWrxEkppN764PI0FIsEj+f6FVB9OeeULqG8w0ZTv8U3ahplGv@lists.linux.dev
X-Gm-Message-State: AOJu0YzLTZcvIIwGWHeCz28UG5RGkP9nv30tUM+UkYxoLCTuj/N50o5C
	vCRhT57d5sAB6Uukm8nSgJEslm+8SXuYzjcyAWAtfmZxHHNjv9RQDIDSe5XhL90V484teYugCfd
	hSAR9s0l6rRS0ew8F/5rIDpMfRU82Y6AoqVJ2og==
X-Google-Smtp-Source: AGHT+IHWv4dKp5kG/i7bSz1apYnsRrEAbrQx4o5iragJJJrMK8m5N8TwV7V7U2xGrwr0JUKngMV/CdjYcW62YtcG88Y=
X-Received: by 2002:a17:907:6d21:b0:a99:ff33:9ba5 with SMTP id
 a640c23a62f3a-a9a336c5625mr270100066b.24.1729064457805; Wed, 16 Oct 2024
 00:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015210300.17941-1-everestkc@everestkc.com.np> <2024101654-creole-palm-81d4@gregkh>
In-Reply-To: <2024101654-creole-palm-81d4@gregkh>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 01:40:46 -0600
Message-ID: <CAEO-vhEiMG+Zb0-FqPBcYANnpnntA-H_D76wbAehgXDAUTYKOg@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Remove unused value
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, skhan@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 1:37=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Oct 15, 2024 at 03:02:57PM -0600, Everest K.C. wrote:
> > The variable `complement_count` is assigned a value which is again
> > overwritten in the next statement.
> > Fix this by removing the first value assigning statement
> >
> > This issue was reported by Coverity Scan.
> > Report:
> > CID 1600790: (#1 of 1): Unused value (UNUSED_VALUE)
> > assigned_value: Assigning value from length to complement_count here,
> > but that stored value is overwritten before it can be used.
> >
> > Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB =
driver")
>
> Thre is no "fix" needed here.  It's not a bug, just a useless operation
> (one tha tthe compiler probably just compiles away into nothing.)  So
> there is no need for a Fixes: tag, sorry.
Noted. Will remove the fixes tag and send V2.
> thanks,
>
> greg k-h
Thanks,
Everest K.C.
