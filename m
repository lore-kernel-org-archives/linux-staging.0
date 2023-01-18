Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5233C7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 15:54:22 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id h10so24039756qvq.7
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 07:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp/FF/OlNcvD2TDo83pV39FfZ/33m8fmuUNBlmKGb1A=;
        b=lnETeaMUTNuDwBg/aRYZXHd9v8+aK6tgbqCGA8aM9w0TW39275mAI+th2srtPCybxj
         uf+W4QaUEenDlDJzsp8ezJ7AwY2cCFf2moaeoIloh/++r384Rl6d6Rp+dNh9oEQM46QL
         BFHM77xNS1E+zqFrfG5CrxsrJVGqwZreaRRjV99hUWgc9wPUMKMpLFQlkCG250ACnNMi
         r126XRMLt4Wsv2KO8KYZESE/D9MGFIgltQFuABSV7sOky1DxCogZv8holEs8dhEgHMF5
         JPJnbJRsQj4P73gLnn6Y4vFaMYf8UrCCs7EersAss0MvjY/S3wdE6Y8Eagi2g2Evf7A9
         1Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dp/FF/OlNcvD2TDo83pV39FfZ/33m8fmuUNBlmKGb1A=;
        b=4i3wyLCzHc29OuSzlMH/eFbekqK5hy7325i/gZD4BjiTj63SZbDPdYopAMLppdoPxy
         EFy6UbFhOHkzZaojmKU9LkSn4NgrqBj9TcQ3ANe63BZcZsfXrZIztjuQpZrU6wLX53v6
         l7hfVG4lc5Ai31bEAWRRjBknEyOFDdbVq3MxD3zfsOJBflt9ubLG1iE8RO3vAfmhj8u+
         nfHA90XEArxqN4LlP95U+znPHQgsNhRXU0bsiyUYljqw5jZaeVn7vuAbw9bolp4GBneb
         4zWiKc0FrEMDVBE6NvXVsKvbJIjIyhUJJuQk3DY913zVkF8Hwchq0rfjSlxTXR9Bmdr8
         c5Pg==
X-Gm-Message-State: AFqh2kqtJVe7ujD5+Xx47J147qutzoePx3NcD3bCOddI3etK1o/uEtqK
	/TyJBFB4T8IUt3dI5QhnjjnNXIKxtdE6A0f8vx4=
X-Google-Smtp-Source: AMrXdXuyrdQ92kiDwWynQkXu3LhRr0aTzZX68EoFvg/xNQF0bdBeBJK4b3kzt1XggPD5xzBnMIVoL1vugEhWI7rq8/8=
X-Received: by 2002:a0c:b208:0:b0:534:3c7d:97fc with SMTP id
 x8-20020a0cb208000000b005343c7d97fcmr429300qvd.11.1674057261293; Wed, 18 Jan
 2023 07:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y8gImBdR6YpEKZEb@kadam> <20230118151656.20558-1-bpappas@pappasbrent.com>
In-Reply-To: <20230118151656.20558-1-bpappas@pappasbrent.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 Jan 2023 17:53:45 +0200
Message-ID: <CAHp75VcxvPZOZpGMSQXkCFv+WekHckMJkympfdR0ih72AjjkNw@mail.gmail.com>
Subject: Re: [PATCH v5] media: atomisp: pci: Replace bytes macros with functions
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: error27@gmail.com, ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 5:17 PM Brent Pappas <bpappas@pappasbrent.com> wrote:
>
> Replace the function-like macros FPNTBL_BYTES(), SCTBL_BYTES(), and
> MORPH_PLANE_BYTES() with functions to comply with Linux coding style
> standards.
> Replace multiplication with calls to array_size() and array3_size()
> to prevent accidental arithmetic overflow.

...

> +static size_t sctbl_bytes(const struct ia_css_binary *binary)
> +{
> +       return array_size(sizeof(unsigned short),

I would use size_mul() here, but either would work.

> +                                         array3_size(binary->sctbl_height,
> +                                                     binary->sctbl_aligned_width_per_color,
> +                                                                 IA_CSS_SC_NUM_COLORS));
> +}

...

Please, fix indentations and patch will be good enough, thank you!

-- 
With Best Regards,
Andy Shevchenko
