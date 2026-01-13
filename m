Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA2344047
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320552; cv=none; b=A++RwgSfI7TGUbo3K0EASEBeHgJyUuiCnGXeZ0MAa5Q17bSlCIoqE3y3RSSBx7JkyEBFTpCASGMGzwOn9Ts9nUOpjc/pl2yc4F4Hs3d/gtitdX3hvoVUlaMT5gQtq6DtHGuxbln8k35Kr/V9FdX+q6sVCnpqgh2YTgNHyT4ZLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320552; c=relaxed/simple;
	bh=XPTzA4rbEuUKeMehzdYIUkN4IWvw4Daz8IFyVgbjSyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kl37oxBuelMFU5+zNqnMYIhZ7TIx9W35aDp9gEAyMSqi0idsDO92Xcpof42HpA7F/whHpFlViDanKehAB4BYnwzC10nm8DhCEfPwbcG6vEZ1HQ8stYQzdIf+UsFxe4W+9zFsjc7l+ts+pYS/wKoNsLOje/xf/9SpyRVVYOWAG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHahsSec; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHahsSec"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso33508101fa.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768320549; x=1768925349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPTzA4rbEuUKeMehzdYIUkN4IWvw4Daz8IFyVgbjSyQ=;
        b=XHahsSecLWJujEpNsHpN2jGSIR4nhD0uzdh/2tzz67P/4XgWHLkArFJYX54rZq0w6G
         vh8JOtCr5n+i1rbNGw6ddVZ5ZBscGXtOEmDBnRPzKQVJSC60EMkXYqh2MeBk2bRifU9A
         NeeFa5G6VXw5f3cKf7l0o/xlTskEEsNG2VxqRc/7/3r+vQ6hxJMFo/S5hMip+Sg6iEPm
         fS+NsNMWy0dZGnbfTWHgNrVYI8AkaiAzLwKEW3IXu5WSU/keCRKGXf11dG1ddxqNPBie
         kYBqzMU8Mlk4R2AZP+hbRaslfWHYqXyBswiF+0DgPxW7sGrRkdCbpxJdl4ciA3gakROE
         Tu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768320549; x=1768925349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XPTzA4rbEuUKeMehzdYIUkN4IWvw4Daz8IFyVgbjSyQ=;
        b=M8fDHoPYZ6ce+oHVirWaE9Ez9NJAzqNpUkIrQEwK8zGgsuye8q+RfuGkYIsaFpFsxk
         di/ZFvZGBc/CXAzVNE4Dv6Bgmb+pz9NC3Gpc7bV121o3De4Het/5oLj/W5zzwP/cRvxp
         eKK2TEFgv5J64Rq0Z+yK8pXeUmGNgQhw6l4Hka1iTWdYdyzUwPnLRxcQyi4hLV5VYkzh
         pMJ1r+1BuZAR61ivMUhTbwdf4yzLPdyunBVDhNa8WRiqQBaTH6S/kAb+aGJzXLR1nVNn
         z9adzWDIqO7TwmBB/te6al32bwKSUwJvwlY0w9mBUDbD9yKB1xzXd04lR0/K7O2FNr3R
         ZdMA==
X-Forwarded-Encrypted: i=1; AJvYcCXJlhy5R6XEynZEv8igsrGDp5LxJftk+a6sbeuC0W70vbrtsCiFRFdOicRieqlZeWkWlZjndZFTSCrV07N+@lists.linux.dev
X-Gm-Message-State: AOJu0YwutJ3KxuB4QOvu/rbOeYVqlk2lGcjTrU1htO5Z7PQwBzY8Y1SZ
	V73j5LUsWjkPpcr+10Vz8VapXipAjbbbQ9wsWX2kKH7s3B5g7eMQOZRdls8SPe7iXpB5HZGNrp4
	RSkjuZmTO7mClqzzBSA2I/yqQuZMz2iM=
X-Gm-Gg: AY/fxX7k23Pz62D9dRDVIeKZLvo+LWp2O5ZtEWW7b0Vwul/TvZkQepFgJFtNKaSPjq2
	JQNhBVY6Ff7pN/kz0EW8ALcrIbwQOvEJcOE5n5i47qHV7IKocmeFxgvyXxd+ZTR33SF9h7IHA3N
	Xg1TyFSVKVxSfC+cUY/pzUB4TDBoNrhq6J7hxI4kX7IRCh7Uj8kP2CHPhvfqXa572jI7dKalypB
	CxEvlVPNgkyeNgfyliCVkcSYXmb5Wjx2/YyRiIQam4W7BqX49OnzaGAtJwmUVN0sVPv99XQpw==
X-Google-Smtp-Source: AGHT+IHePHMDyoi6sr0yljTx/L6uNJTAHhACCTqgMHSNmrJtCfTvA9/YPbW8Y42q7oYdiGaWSr8QPTCuea49dVmU3D4=
X-Received: by 2002:a05:651c:1596:b0:37f:8bb4:6b with SMTP id
 38308e7fff4ca-382ff82321dmr57334941fa.38.1768320548451; Tue, 13 Jan 2026
 08:09:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
 <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com> <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com>
In-Reply-To: <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com>
From: Anubhav Kokane <dev.anubhavk@gmail.com>
Date: Tue, 13 Jan 2026 21:38:56 +0530
X-Gm-Features: AZwV_QhWQUVOnPDw5tPps3huJowa_xdkMpSs3Gvbmjzbuuh8CFwVJn92wlqUGAU
Message-ID: <CAF6CsJxKZ2FvRWVR0SjyfYR=Nj+4uCMgaJgO4BVBtbMvakXhVQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > I looked into implementing kcalloc() as suggested. But the issue is str=
uct
> > atomisp_s3a_buf (and the other buffers) are defined as list nodes with
> > struct list_head list embedded in them.
>
> Yes, and how does it affect the allocation?
>
> > The driver relies on adding these
> > individually to asd->s3a_stats and freeing them individually using kfre=
e()
> > in multiple cleanup paths (including error path here).
>
> Is it the issue? Instead of incrementing by a pointer size, you will
> increment an address by a structure size, this is how + operator works
> in C from the beginning (or close enough to that time).
>
> > Switching to kcalloc() would mean the s3a_buf is no longer a standalone
> > object but a slice of an array. This would lead to invalid or double fr=
ees
> > if the existing code tries kfree() on this array element.
>
> How? As I showed above you need to carefully move and replace
> individual handling by a common one. So, instead of allocation per
> item it will be an allocation per bucket.
>
> > Addressing this requires a larger refactor of the buffer management log=
ic
> > across the driver,
>
> Exactly! And that's what I think is the best way moving forward. You
> will kill two birds with one stone: fixing the issue at hand and
> improving the memory allocations in the driver in this area a lot.
>
> > would you prefer I stick to the sizeof(*ptr) hardening for
> > now to fix the checkpatch warning?
>
> See above. As now I think this is unneeded churn as the idea would
> still be the same =E2=80=94 moving towards kcalloc().

Hi Andy,

Thanks for the explanation regarding the pointer arithmetic and bucket
allocation.

I understand the approach now, will work on refactoring the allocation
to use kcalloc() and updating the cleanup paths to handle the array
correctly.

I'll send a v2 once I have verified the changes, though it might take me
a little time to ensure the cleanup logic is robust.

Regards,
Anubhav
