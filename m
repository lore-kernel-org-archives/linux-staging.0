Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904D3DFC98
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655356; cv=pass; b=llFObsqwU8IRY8g4oJupAviDIAU8bc0m01X9OvY1ogGA9gWF99Zfn33VYrun/K1KdPQHTZzs+5rIbYmNei7hlRl8D3qJzNa52LgKsYv8iLptCwg5ph3NNCsPTJhyWPq5NwqniRfXOUA7gEgWcH2PwuLqc3bSzaUU9fNiOGLQDD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655356; c=relaxed/simple;
	bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3HPxGNTPv2wZRA6HR+JhjhGFH7BdQPG4Cy+gW+eMarL+ZK0P3Z65PPJPtiDCm5y48lEWqAkabUaQp1KhY7YY6iPoNDTa9F3MmgispxKp35WfgyXe6WZjQ18QNWNK8IIusg+rXamexjnirdXhu5dtIabd9p/t7UUvIqiSGhWX8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNVDnvjv; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNVDnvjv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-441209fb77eso1226898f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 10:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777655353; cv=none;
        d=google.com; s=arc-20240605;
        b=Ttg3KV++5DkIiturnKJuWUxH7D2MfIk2EJuAfZY1j9W7Q7i6v7yPbqYHDlXNXgB2/9
         XtQKKLPfbFUhsK8DxFOy7vv8SqIZ8LAdsVDR7nbdjOHNYo3bAS4ZNSqMCaDvroUsz5tC
         ftq2qEcA/Rng71jIPiiFOArSzOKq/wAOSMC8rwTcf82SYFrGjNh24TMfCzx+BG5QxWmj
         +QEES6+JqwTh2F5VmfoxD+G6peL6ELkFFfd4hisvQTHOCxxZUGISEs7FkvytZi9qhIcK
         QBBPWzJ5+J+TdNlrsopYQ1os7hH0QH6+1hsEEUxel2AkvWHTl6e38Kl5SyUZACJl0Hwx
         qkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
        fh=6Mk44zeXUkwNog0Wpn5bN2FIP7yPD4nBkhKXAFlvso4=;
        b=Sr4l4j33GBd38dc75IRNSrI604zJ0CZQfcr6IWofNl886M4f5uQKn4GxsMehq3Bh4J
         HqPF2ms7AgtdK5UM1Q5SUqVZTmkjvbca4SPwRuLcb2kWRXkNS0PEkm5b1es6s45tNxir
         kWB8fpMRqMo19806Ea5pVI4gd1yy3IgWL/gYzuKPJumDEzWwEjAnT7Ft4Rh8mDJ5m43P
         aKUM69ffZpPqogv9BMcZbJ/ctxzwQRDT6V/zc2ylCZeguPW2iTLVlkpvVfjkUeOLnEiK
         4kNUTTTfcoAzwKsZVpNXpOOiwp0c75XlfrFDA9GF+kt6v4g6GMohq5PLarCsTXVnZz5m
         CaIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777655353; x=1778260153; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
        b=fNVDnvjvxWkt2dHNNpvwBE9K9rnC15E3JvSBekAKTwaNLEPf9QRnIIrxxVImW0EHkg
         UpLx5x5c+U9rM495sNEoW5SPHxi5t93WF+9ZVX4tbfTVcwEBqT24SERVSnPJWTb6l7r0
         t9Gq/zUPdVUqTiR6QPN0I6kuPLbrkBe2PsIJo0989NywN9xylsi+HMjHIuAygRjsQcQO
         I8GVuw+RsxKEwuQUIvxHuiB8q2ipm4h1ce2DMkr3feprOtKTJp2/Qs1WR/fGWMkUMxwG
         mF/kWBGW6EutIlObmbJlzkxNmDzh/6ClnAeXvJCyyeTpzvgXqmb7MxwvBIsNhveDBLKO
         a2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655353; x=1778260153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
        b=kZCHr7LKfZO3nDzQz/izSU6bnVFPre3WzXTH8nwTeBoFhQoOEkeVI1G6PmX0b6xSEg
         KxLfCCHqaUU9yBzc3pDaLLaES4IRXB5wpQHsuI+nIFuIy9WpQVKntJI132ZGCOh/jHLf
         rzM3KXPVCDZgP5l1+2zUbKmWdAEAzaEJo4+pFhCr3XflwhEMazvn2sE8MNrad6vcThyl
         r611swumkbfwcOSz+7GtnYnLy4VTKpkuzr6crmE718uAD8j6A3EtgJnKm6D1S9DZDem5
         ADpa85vFN1SrVc97LttLeDigDZkoINX8jg9y+Ssb//Sc5ctHpeoqtNHMBv4Ys0ppY6Ip
         JCrg==
X-Forwarded-Encrypted: i=1; AFNElJ+ymYHlCDUsqOHGgHDUCIWHHfVJrGpGVeokIrfCRL9FqiJP2zy6g/ig+3k7dWvZnvVXvhtlv7Pd/jEYwR1b@lists.linux.dev
X-Gm-Message-State: AOJu0YzvG5yqZULpUmjCyuYvrKE+noMoAOBTaTblntbvzlgrBt3WPRyE
	QrHpdLTeso4GV63xST/gyJ8lLk0iJy9Ao7aROxSACafvKIEgSQkfMrx0xk93rbYiOvUiHVwUYVG
	6lIVPMj7jF0qloePdMylv3DPyHdS38TM=
X-Gm-Gg: AeBDiesCYQDJ96FdqUNi5GkwlyJZzTiADYE0U14OfgSk4e4SH6ei8KMFqFkcLgmpYym
	Kxwwwbra2a7YKtbbxsXfgjcgCprm5sntPfaeUVb3NFaRwAXG8yUyByI7WShGKcHQWK4MXUnAhNb
	wgbqQpCZrrXS/cfrLM242ymvZDrB9+KPkzvcIDWl3hRMsZFYoRVZjVo2fFOsRLCZa1ieMCur1Rq
	kk35IzEmHbbe753Hi9WhlQu9uTIdz2zJc4pgyo6p2STB4lmbDWYNrcFXdHfC8vkrNcyUTTcdW+3
	DFaRe0Z4NF3EholcU23v
X-Received: by 2002:a5d:584e:0:b0:43d:6df0:c7f6 with SMTP id
 ffacd0b85a97d-44bb62060a1mr390196f8f.18.1777655353183; Fri, 01 May 2026
 10:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
 <afTQZHlmMkTZDP2H@stanley.mountain> <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
 <afTafvSmlqsVjUjn@stanley.mountain>
In-Reply-To: <afTafvSmlqsVjUjn@stanley.mountain>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Fri, 1 May 2026 22:39:01 +0530
X-Gm-Features: AVHnY4KyktTpOFGoSBPQqQbUP7lCZsrIKygNVKcP5aCI-rI8ztJfeJMEQYwfovE
Message-ID: <CALx+fbbpAoKvPBvOnuGXKMnkitXDvLosv2U+aJqx8UJo9__a5w@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan Carpenter and everyone,

I understand the need for verification.
Unfortunately, I do not have access to the physical hardware to test
this specific Greybus driver myself.

Would anyone on the CC list who has access to the hardware would be
willing to run a quick test with the userspace tools.

If not, I am happy to withdraw the patch for now to avoid any risk of
regression.

Best Regards,
Shyam

On Fri, 1 May 2026 at 22:23, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, May 01, 2026 at 10:15:57PM +0530, Shyam Sunder Reddy Padira wrote:
> > Hi Dan Carpenter
> >
> > I have not been able to test this on hardware. I based this change on
> > the standard sysfs formatting requirement as documented in
> > Documentation/filesystems/sysfs.rst.
> > If there is a concern that specific Greybus userspace tools are
> > sensitive to the trailing newline, I can withdraw the patch. However,
> > this change aligns the driver with the standard sysfs formatting used
> > across the kernel.
>
> You need to test it with the Greybus userspace tools, yes.
>
> regards,
> dan carpenter
>
