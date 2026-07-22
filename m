Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BE3F54BB
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784696321; cv=pass; b=dTlsvHiJmCAcMZX+S+Uc4Afk9ThX5iO05MHCoE3sD0zLpRjsYu308OR/KEVk8hjkRYDX3kxQTNNU5xs+XNnroyi7bae6o87BtDCeuHE1xxfijlGGR8llV1Y1f5j54FTfZRf9Qj2qTO9YFzzSx1zvBSCP2jXvpvLGQZNiK1M/zuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784696321; c=relaxed/simple;
	bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjSVCVm0I1ALBWexY1KYrvaQ2kYhEzFrX92lTIYXIKWIn9S2pmxuOdEhCFkpL36Z2+q1ICe4MPGTHNWJoW6CcbSuRbUeNHUOYzu5fPKDYqrY4U3xNBalQUdsuSMcQv5C8tUdMkIQSu1A6rgzR11Snj1S5NqbLBd+L+7+B9DHyRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btEF84Kw; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btEF84Kw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c26d7e951so214599166b.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 21:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784696319; cv=none;
        d=google.com; s=arc-20260327;
        b=V/iGA4wN6jN2sQA5MHeUZhxpHZmblhOextyd+OMm+Oq4s5ACyNX/AlNvGDB4oT81WG
         /ffQjeZ5KKyakcNq9JEksBKrouiIYVLKCZLKzmZ0N9nN2w0B/v6+WV2TBM6l7DmJ8sPO
         cktKjciasB7Q8GrrvezrgLeFjkIeGZdu95aRtvtCVhDFbnlgbeNnZjSItuzdRgOKvgWy
         rbR09csMMREfsduX5w7mm45mK4WoxqVGr6SODt9D50N4UAxeSvPZ9dyCPC5Z8lw4+Qz3
         +I+ctxlLCxksxI4uwBEMiRCPQa2tB0dK5Q7HUTmc9SvgD0Wl95JMB7nzO30fOl5NdZw5
         b+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
        fh=s+lOHRnHgzYYjOQ+SYvHI18GitTSvgVoQP65KyCndvo=;
        b=TdhqF2iQnrPcmVdwtnJxjlIkpA5eHH0zaq5kuN4ozTo9hA3WtSbU822HHYhoNiDOf2
         +lyR6inoV7rbp6U49nD8Ihmnmlret0pZEGvie/i50SSoBvH5RRVg+x6EYw5mUSZyF4DV
         DsfVWtJYpH97GkTDaq9Z9l61jf1bw1DclCNL0H2UhhRnVXTyC+qj2MMg3kdg5JVpFVgA
         ZZ7RBUxd8tx+LFOAUSfEfpJkAiDlScTQbGoghgGyXA8RToxH8zQTLiUhENX44kHTUq61
         jt2/yEozWxuQ1Jy5CbxkdxnbUTLHgxY/KtOt0qe8OpwIDagD3CHH2hT9HVj+C7HULjfX
         L5Ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784696319; x=1785301119; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
        b=btEF84KwSkepeLQGAXFx5sM+FlBrvJnqEp6W+mGW8Uy2WQ0eADx0YjTjsLHUodvkHX
         f/2t3v/h93jkLWCCsK2wV8WS6RRHnSxbMqKDgRUvdhZfPunJGB/p3gxk7P6LgCsADIkQ
         XOPqms0PnPuqZHVd22laf3bmYkhwXjy75cjBTq8Uheju+SxslRr4kfsS/9qYZeTBR2q5
         fCW3yq+GkKS6UGw7J9ktJdVETH/m/mnWGUQkA0EDFtYCBNa0ly9eWhr0WAERc6CjVYte
         nX5P1KJv48PCAIlOzlJPOXQ/gSywG+nioGmyiK7mHzPkiNh8Piun+EjbbJdxWak3j3zf
         QfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784696319; x=1785301119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
        b=UFcuAoK5TR09vS6eHydFqkFMKIZXNXo+0c/nGcjGvA8K5ih8xL9xD8IFLU9iI8NONo
         iHsIb35qwrTq1OjPd4i10fJDJzJZTCLbXlMrDV7wPczSUD7SXyVD+hZJ9BYZvUQv9+Gy
         3z6LNL3ub93+F5MhgFpVCv2hqBBjpP0kpIzIZAiBjtEnaFRpnNNlMWHkTSlxO4REi/7u
         hsROzpE3FO+qbdDfzWAvB3dd2ur8YUjPs4whrxjHQfybpfAuMW604YjvmIxPbAV3n5fG
         tqlnxza926xmIoVaT4Y50ebU/LUAbHgc2vrHw2N2blPXzJq6MlB7zpg6NtyYaS7flqM5
         AEVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3jgl10NeaFJTIfkQ1+OoBREwKs4yrM++i0hfXd3H7/ai7ljUIkORRmgq66Ai27fzU+198zsGpZVkTfNn3@lists.linux.dev
X-Gm-Message-State: AOJu0YzVvgJUtNgS4wSiC8c9aV+/ncAVAHfPlwRvDK5LJaunMo1nOHt/
	Ieluj3wJA4izwAkuDJL9cdzrGtwoVlwS50MkWMWjhGIbSMtI6HPiqvcQAsa1pbQ+6mo8GO4516r
	zeN516B+Zdz0qlCLbzno8hLonSgnxlMo=
X-Gm-Gg: AR+sD12wq8+I66vrX6arT48N2x467CkiCBWnbHvYfKv999sFIDVOUNrf+Dob7F+5aca
	GoCUdI/1jsbRtLwoHbsrceHFDFHBADTz+crF8rkAImMUKhC10gsqxGJih8FwAUEKc/ZgNAXs/iu
	I2eEyO/GHh18d7j2gCIONYYfIiRPcsfJEUgtGLd3t8yd2Lm1ksOJRFAJibMCYpUoF6kleLrx8CT
	zQXrrnvHniTqDCIoMEtKsMADlWOx3xK6HvZ8xydc/QeWBU7zqYMveNSlnpvCFLe0eLBYd31zTHo
	zpbOEreyh8i6splquL19jYKt4cb28/hY9WbDYG5ccDOJe8PwaNznFqwtaVCHEQALB5PaD31JJmp
	Y5rrHy6ZqeJn69lNKoBMXVpmKnvce128yPnUlRwxNy4ItyhXH7cTfBilaARg=
X-Received: by 2002:a17:907:8dc3:b0:c1c:2c92:fd60 with SMTP id
 a640c23a62f3a-c1c2c93cdb8mr154769766b.13.1784696318562; Tue, 21 Jul 2026
 21:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721214238.840406-1-nikolayof23@gmail.com>
In-Reply-To: <20260721214238.840406-1-nikolayof23@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jul 2026 07:58:01 +0300
X-Gm-Features: AUfX_mzCi86JGgiYv2ZdDa9mOYUwwlZcSdNTj_cSAxQsSOFdMkR8VtM0KfpQJx4
Message-ID: <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: atomisp: remove unused functions
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 12:42=E2=80=AFAM Nikolay Kulikov <nikolayof23@gmail=
.com> wrote:
>
> This series removes functions in pci/hmm/ that are declared and defined
> but never called.

Don't do it per file, squash these changes as it seems not so many of
them (I assume you checked the entire driver, right?).

--=20
With Best Regards,
Andy Shevchenko
