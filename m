Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD17168
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:36:21 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id r15so22851862uao.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOYKOMNdn7daGbU6jgLJi3oEFCH812Tr1mFTkATHWbM=;
        b=dv9b9/vqTHZPdaEMYargHBS4A5dlQeWoYXCDzcpobdFebh23GRb+8bw4rxhay5OVzV
         q4iOrsoS4Ma220UPt9kVVfLFDY7aaMwyQbvGvuzdP8gtm/9xP0RNgpBFRtTqDeEogJJ/
         SVGrNAGMBWnBrNA2/t4+GtG3Lpkwf9SXTf2+SMKckYYuqb8CX33CH4cBnyLfcJw3sFmV
         ym9FiSbQdE6tjguw7B08w1VNejUWXNg9jPz/uZi7EBD9ghjMczdSwJGfOKLUhLGP3Fp8
         B4GS5WrvQJFi8XZx/YkevkMwgUxo0y6IwkTr49n2IyuGlqCwIYZrYItAsYFDjZXlKWBm
         Ct4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOYKOMNdn7daGbU6jgLJi3oEFCH812Tr1mFTkATHWbM=;
        b=7YaRTMRGqhUP6xTVnT3pLCr9XTLt1ZIBip0jibYLkBvrfq5xE+J42XPsr+hrhwVbeH
         Ry8vOP42LUC1tF2jjSUqf/zA5L3LXVblTpbR7yk0lmSi9oLfMhVINJSJ8XgT1jgYDTYJ
         jTi4/aaSX5KtfumggZZ5E57dahfQtu/c12y/D8436Ggc8NT4vWIHpYzUPT3vG+5dfaUL
         YpI94zBeI24S/8X4QSkoE2Ll0+2Y0vyhzZdllSr0pSXfB9feNXjBegp+eqky0R9iWvoQ
         W6lFuqzwXpiyoZm0EsT0giP5hzMDODOx8n8nH+SfHYpwKf76N5MBonHz7uXHTxRaSqgt
         ZlTw==
X-Gm-Message-State: AOAM531LYzvdRmmTXJBJV6hxNtn3vznEDQuNXElsri0tiCM8eaW5XnSP
	CAZLUJZOkFLVZ9cav9ZOdgdsENtYotUqjxF1tLw=
X-Google-Smtp-Source: ABdhPJzEk8+MsRvQw2gNjyoxD8tAuUiiVmNCo//Sj2gLzgGnTvbK9GC8gICCOiEg70gNF+dajIqVuSVB1vNGZ/vlMG4=
X-Received: by 2002:a05:6102:dc9:: with SMTP id e9mr24344482vst.17.1641814580785;
 Mon, 10 Jan 2022 03:36:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
 <20220110111036.1380288-5-sergio.paracuellos@gmail.com> <4b32313d0642a4043709ef98339497662dafb211.camel@pengutronix.de>
In-Reply-To: <4b32313d0642a4043709ef98339497662dafb211.camel@pengutronix.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 10 Jan 2022 12:36:09 +0100
Message-ID: <CAMhs-H9QC1MdiA7ShntQ7hOasRrZRbBok-zTqFMUPQjtdnwezQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] staging: mt7621-dts: align resets with binding documentation
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Mon, Jan 10, 2022 at 12:28 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mon, 2022-01-10 at 12:10 +0100, Sergio Paracuellos wrote:
> > Binding documentation for compatible 'mediatek,mt7621-sysc' has been updated
> > to be used as a reset provider. Align reset related bits and system controller
> > node with binding documentation along the dtsi file.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
>
> Is this patch is missing the gdma and hsdma resets?
> I only looked at v5.16, there those reference &rstctrl as well

Associated drivers are already removed in staging tree since are not
used al all and no effort for mainline them has appeared in a while..
See:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=53a2f33caaeacb820f554899f0780387b1b4381b
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=87dd67f496f71c3693431a236b2b542793d786ff
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=5bfc10690c6c590a972be014ed8595e77e1e2dea

Best regards,
    Sergio Paracuellos


>
> regards
> Philipp
