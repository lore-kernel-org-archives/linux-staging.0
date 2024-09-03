Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F097919F404
	for <linux-staging@lists.linux.dev>; Tue,  3 Sep 2024 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359449; cv=none; b=TWTjrFpUzpeHHlxk2Caq0uZEjDkINzjhQA8xAfHIr8Dc9FVkx1CH5kYP5pYYzZQfTzKGJfO0VQ3Ei1M0aDbZR63r8a7TURZKr02KQ1z433nlE552Ojc9CiiyLVdyWlnXCU6M9kYu0JgFPoYgCfiWY1DRsdI9Xky+e7LnczDdwbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359449; c=relaxed/simple;
	bh=9/LvUuCS4XhoIwjDWaQrgiAmfj0naOBxYwTFNfhl9BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFzqm3y298c3Dt28TDSTvemmpbuD/cDzWBtfd+rEuonMbiUy4kdZRAadv50Mw5d9UXM7hl7MWwILLb8GpldqVOtwfIz9bs63SK77VX12apa0vKzFEjtadWd1xMKwULmsyMNn5HMY9JBjJX2rWfQJk14YVrae5QS7H6yHRcLlIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQLiHpaZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQLiHpaZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a86910caf9cso1062089166b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Sep 2024 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725359446; x=1725964246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTLDxucwjwyWimGcHcYMGMu+uTN8r9AsQdQdKm7NNO4=;
        b=CQLiHpaZZLY2ocZBP8DnQNvOZjp52tcRwMbLuVmmbUdSHe0oPSxk/A19y6CNFTZTRE
         JI7TWmSAG144Kb9/Nk/c2L30C2Lhx0Q7uSEanR/IKyiXuy4iHeh+CrVXFe3LflhexC5r
         OMqj5hx+Cwiqe2kI1VkrmwLKP9Bi3sZKBUJgIh7bTKn2rXR/Zzl7keqomgljxK+ENp0r
         rZxUd2sHzSvZBP6seeqtLKjyljqc4QQ/2kBiqLye0b6a1nmVHSr1NYZE/+wZjQDYZlqo
         Yx2LF4UbV1Wy6h+bBfKhFETHOJj5rqbYD+YJKZUhSu8DTsEnXHe4dZCzmAY6SZJdrMl8
         aVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359446; x=1725964246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTLDxucwjwyWimGcHcYMGMu+uTN8r9AsQdQdKm7NNO4=;
        b=NLzqBf+gfkGZapM6n+Op2MKHhoLErPuC79TvavSG8kPD0ITHaitM9dXvjnfPMpNAzs
         E6RxuD7KgSJRps4F3GHF6N3JaqdeRLv/ztdRZK+QIviyG239xxXt7J+mCvDViEX1dA9C
         BMdUe8xGNt1Iu0Q+cO/LPboYlBjw63M22kxLykUBG05GouCE+6bm/6m+GJaacLW64qYw
         HLOZ7pdcj6iNrC58H824QC+vEIrzxgPmn+bbQwrW1EoHGcaw4WYAEbzkdt+Zb4qctQeE
         GSPph7QEwY0cJsW/xMVoQbrgwmq+60gMwp0Khv2rzJsJSL4U19STePK1Z1UD7WN+lWHi
         ep6A==
X-Forwarded-Encrypted: i=1; AJvYcCVZHP2ficC9oy5NZ0rNP7wWsBZQBmrntNyNFdyXO+SynJNI5I5LZ9K0h+GOlFkQoNRs+fIJU/62pkynR0/c@lists.linux.dev
X-Gm-Message-State: AOJu0Yxse4aeMX4sOg9hz5tUd6xVqphBeNwMr3TQUYV+ajqXKXiQecgB
	OKkM8cG8OaZbHvdrIaj4cA9PDK9dokiRJ56aw1NnZo+1737C31cat9zJ6VzFE/VlrVAOk+I+MFt
	KZZCqeZVN3JEPRmDA4V7Z2icWRBRpDFnc
X-Google-Smtp-Source: AGHT+IEyXns+ABOcTXdlkH9hENJxAucp6nOJeL5bX94OCsp6Pynerj+R/8vKwFIsLTYECUazbiO80sbfehXtBf2CIUw=
X-Received: by 2002:a17:907:e209:b0:a7d:2772:6d5f with SMTP id
 a640c23a62f3a-a89a2924aa8mr1254672766b.23.1725359445903; Tue, 03 Sep 2024
 03:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240902095229.59059-1-hdegoede@redhat.com> <20240902095229.59059-3-hdegoede@redhat.com>
 <ZtWpi7_S5d7NZx61@smile.fi.intel.com> <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
In-Reply-To: <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Sep 2024 13:30:09 +0300
Message-ID: <CAHp75VfZEjq+ep_5yjTr+-mPi5F3XurWDrt2tNUX+PW5k-HkJg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 12:27=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 9/2/24 2:03 PM, Andy Shevchenko wrote:
> > On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:

...

> >> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
> >> -                            struct ia_css_binary *binary) {
> >> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
> >> +                   struct ia_css_binary *binary)
> >
> > ...for example, in this case you touched both lines, so making them a s=
ingle
> > line just reduces the future churn.
>
> Ack, fixed in my media-atomisp branch.

(Actually there are more opportunities like this that I haven't
commented on in the previous reply. I hope you have already found them
and fixed accordingly)

...

> >> +                    dev_dbg(atomisp_dev,
> >> +                            "ia_css_binary_find() [%d] continue: bina=
ry is not striped\n",
> >> +                            __LINE__);
> >
> > Now the __LINE__ argument is redundant as one may run-time turn it on a=
nd off.
> > So, trimming it while converting to dev_dbg() makes sense to me as a on=
e
> > logical change. Ditto for other __LINE__ cases.
>
> Dropping __LINE__ is the bit which I want to postpone to a follow-up patc=
h,
> the messages rejecting certain binaries as not suitable are not very
> unique and the __LINE__ print is necessary (atm) to help find which check
> exactly is failing. Not ideal I know, something for the TODO list.

Yes, it's fine, after I sent the previous reply I saw that the
previous implementation was a simple wrapper over dev_dbg() and
__LINE__ "issue" was already there. I.o.w. I agree on the followup!

--=20
With Best Regards,
Andy Shevchenko
