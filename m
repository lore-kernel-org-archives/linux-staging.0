Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD5309F08
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228293; cv=pass; b=oQx/CeuyAp5F+lvIf4EsG9KMenHO7gyN3XRloKyuz2y2RwUIBHO/B2Hnr2xG0LDPgz5cTETv5Zdn7NALIPH11oPzqSjKExs+2lqUwR94QuV6reytnu/6Yqdhit97A5RTxxFedzqxD7Ik9w1R4AGzLhwS93CO3qZBxfMwov7brT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228293; c=relaxed/simple;
	bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5PLCz+XjybGu7IK5SSuF8fUDeXk5PbIJxqFZf4Wgevytme831dkq/fImqb3wYpe+eOFW8pSwX7BHgQS1/9mWzZLuspsm5yHjgzY4/IOX8eeOv1hDh5bgfFV5psgQT+AjH7V2+Dg/IAL833jxmoDVTlaUPKXbBmvHkN3u2sqoYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO3Sm9P1; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO3Sm9P1"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so205812066b.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 08:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789228290; cv=none;
        d=google.com; s=arc-20260327;
        b=L5U53krwDOzqANg1QpoYAtFaMxEuJ1nTUmy6JuQCI8pSHdYJVQ7gPchp5a/viH3sdA
         RS5y8K8SLwmcLy+wlt//Nvk2ELgMwRYAjanCKfRzM9lo1MXu2pIJwAhoAgdHVDBfeEf5
         pCIWDMH7QT0fyBt7JRJfS+n8HrlFTQzzIf1/faFbZBHjFJCizleoiA4TX+MTWyF191W0
         1l+zcPZazPk+dHFDTDQVsz8RdrzexiouVW3DmdU+0evy9GxuSDKlyIAK6eamJckGCNRs
         kYyV7Iwb+ffEfCe4rm6ZtOUfIfQDOxOdydnTIQGdDuR7fY2/xz3U0G/bgm0wAzQ3Ef9x
         ZqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        fh=GEW+HRE+vElEzMR23Nnq6H/k00TzBHQnde0bt1DCPuQ=;
        b=TMRlraBpgNHmWvPHJNH2CjbeEpM3/fFa9dZnKQ+nEuuziUzGgKAyPxMyprqOxNQnv4
         dxtzgG3v8AAmipf2SmfR2Nd/QCNxhySUlsoDS0rfoz0E7Bhe2Y6XucdUFkXr31jkfP+w
         D+1VcK1fN/BUDe91ROtM3LQU5+/pBBDNkAiBtBZLBz1dhh+bK4+4aH2XHjhIRrBU4oZq
         Zz93L6sE9nQj6gDNsCLSFzDHOMIFwutGya09M2IE+XhCbRWnz9GpoqcC74GqXmGiqFmE
         G9b0kLh/1FMUO3noTwT+6PDN7mfLnf0OMOCZHFaKBSi1Rnz4nNAwf9wnEydtijQfKMgE
         zsWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789228290; x=1789833090; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        b=BO3Sm9P15aTpMrma7KuSV04PIYo675fDadr+1bDqFEsvH8o+dp6nyuAJvCKB8k6aB2
         ikm+Mfuu5MpGoNj+VK6bEtbha5vGe/Nken38kNj9dgPkbAZbY9WEz2T0hLvTgclaMJC0
         ye6Y6q5HjlvRNE9ud5EzyRhi57rfFBqTdw3NKE3l+BCQ543d5wLs8ilQyhU91uW72Xkz
         i7a6qcHmvQbfHGEf4mWIFR1+2W1Sl2uWH4c4BXsG6FpWu+7UUvP0VctAgnOdFTeTOTtL
         oQnFFStlZAfqDKqrU73dXVQ2ZiN9nCZPfA3scFIJLtVdZfwOKNu7D9Ow5mm1pmj39sOW
         hhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228290; x=1789833090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        b=l+vBVHyVP1CNus9A4dcDSnZvZu4oMbc7Ux+aRtwu8dJyIpVVBrBQ8J7jpLRVXwcVuq
         E75ASbe6+ic8aPHNxFGXtakov8TSJvcSfVTi2ZGi/t+Y5DkfLYXNeqyqyVvKYyVIgYO4
         EEfBw/lBzhtUP0JSsXATVuSPOBpotWeNquZiiX+OQUK/fwGbYCnhLrMZ5hPRaxqeX/nG
         5TP6f0QLvNaS2ksnp+275zAyR5bkRnTFarQFV41PdkrzyBOUaQvWZNjP5SbqL1hB9cFC
         NMUGVg8pZdfFS5qP+1+MLL+Vh2H99H2e0lj6tqxbLDjjBrBnep8G+KawFFc52f33/QCF
         ZfSw==
X-Forwarded-Encrypted: i=1; AKwUvBwVbC7pLZ99YSwyYU1ckj2MQWJ4nGaBlsAopr4a1dQzii+s+uTcBllmt98DfnHW2900fW1hgbHZs1dWi4mA@lists.linux.dev
X-Gm-Message-State: AFuF++k9nTKM/5ScEYwHqsYMZi36WjVWyKrEJXhLYnGuMoQ7SPV7wo18
	8JiguMnbCo9LcoGAo48t2kRSWFNVwD00/eDsbKNTLFYIm6lfFZ528JIO5tPMzCjO8AFzzMAqX3j
	D3J4TPFH1Fyf8KuZkoAKS9zxCvQol+lc=
X-Gm-Gg: AYBFou3W2XlZLdL6lTvjiSsbIGXXBnNPJti1SvRbx5OroptkcE/m3gWBRFNXx/jy6z2
	5zLCxUCEVpRsgEgdy8dsDryAQV+DOE+gsXk6SOPgB8yMalHHQjvRKjk7szpz4MQULimwj+ZKoyh
	C1JbC7S/3W0kDI4jjTeJZwwP0poq9oWtzgGQDWQ98tj1RX7ahd485IhJFVt3/yUyyc5q6ZLKIZr
	XbCJ3YJmwKxBMRRT0gwM2O83CY8sGXyDytwn7bw43/1EWDTwcFfe7dBTgoD7AoPqbxx7U+iMwMY
	y+D0eCoG5QS5xM+gLUua11XzCKGTsi9lk/phWte7BD8C5SYuvE8WumvY8J4Fuv3OpkE+EDmCY14
	HSJ4qV4eSCO+NnxjUkApL4to8KD43278FqkGy6NYKWWTp38SyQXUoiowSsWR0qvxc51qeJWzMGe
	mRu8Nn2LDC54wnfF8XQ2k9/qPub1EEc0A9ok/MMDA78m+qrW+nTPI=
X-Received: by 2002:a17:906:f585:b0:c26:1648:a075 with SMTP id
 a640c23a62f3a-c29667067c8mr442873366b.48.1789228290103; Sat, 12 Sep 2026
 08:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
 <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com> <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
In-Reply-To: <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 18:50:51 +0300
X-Gm-Features: AcwNN1X5L6R8VeJmkjFevWlO1Zk9f-pg5FslM8lqB45lWu3P0SnHxHdoYHbt7ts
Message-ID: <CAHp75VdKEzXDyUZbDwS-dGECjDXsosQ-62yVK9PasmjBBTEPoQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: ricardo barbosa <ricardobarbosamscg@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 6:44=E2=80=AFPM ricardo barbosa
<ricardobarbosamscg@gmail.com> wrote:

Please, do not top-post!

> Thanks for the feedback, Andy.
>
> As a beginner taking the LFD103 course, my main goal with this
> submission was simply to validate the workflow and git send-email
> toolchain with a zero-risk change.

Unfortunately this driver is not the best choice for a newbie. We
prefer to see real work (likely by a contributor who has a hardware to
test) on it first.

> I'll look into more meaningful tasks for my next patch.

Yes, it's still possible to submit some cleaning stuff, but do not
expect it will be accepted or even reviewed, we lack the resources to
handle that driver ourselves with all contributions it gets lately.
Thanks for understanding.

> On Sat, Sep 12, 2026 at 8:36=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
> > <ricardobarbosamscg@gmail.com> wrote:
> > >
> > > Remove an unnecessary extra blank line to clean up code style
> > > and fix checkpatch CHECK warning.
> >
> > This is the lowest possible priority patch, if even considered. If you
> > want to clean up this driver, there are more interesting tasks.

--=20
With Best Regards,
Andy Shevchenko
