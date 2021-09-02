Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874703FCD
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 20:24:59 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q68so3201663pga.9
        for <linux-staging@lists.linux.dev>; Thu, 02 Sep 2021 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUldLVtWO/tpg8tbJWjKGXY9tHoc65390V+frphn+q0=;
        b=lmXnP/qesnEmSmdyXbgcBavDjTHJUc/zbUvuh/ddchQ0qm1OysvfFJyUtdZ+gIcTPY
         IyZW2LCwHUukuZfYWCBR/X9Wse2iqpLwFvE4eja2sFq1z1OrDzSW6tAm4vdLkZzRfkph
         qklclEZ70Oi8ukggGSIa9bHZAaSH3vTCIOAP8/kU8M/v7XYv8IYeAMAtL+oL0sL3NdZk
         tiAX8s3KyGyqpERBHG15YO8z8H3xiVHWOPEypt+xsAySQPUmggd6Zqr8BMw/lp+wRPT6
         QAEcHOm6hli4oUlx2YU2cysNSPu3AEZw0ycoUwTIhAi0UZ/HVzlRMetmgaj+45OF2xnv
         v8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUldLVtWO/tpg8tbJWjKGXY9tHoc65390V+frphn+q0=;
        b=NNC8bGfBUkpF0BshDKTsK0mzfsTv8SVzHnV8BBQauLBtzjC0r160s5gD7OTquvQXbt
         G1btudBbSAgWQWXVMtTjcXlMGVJesMR8A4xHlpJk/roibffpJOrb3fnjujVmLK1YG5oe
         r6ErsaC61jagBgpveHu1zi/OYCq5l+0sscKeYw402UhvctET5Po8pBy3ABqjvUTvkMy5
         8m1ZWZdVb14J+NdtzqaKTQIoB6ZAFXbmGVo0v20Cb5MaU4bh5YDfF+18GIUxMwdZoBm0
         NYuwCno7864M8KrvZAXGqFSXGUjIML473YPV63UYx7AZ8mSqr28Nms+b2UMGTb+Wwrhk
         45wg==
X-Gm-Message-State: AOAM531nRU7h3S2EVgYVuAMRlZ75dSl6UpSWD3jEvyIw4ILKaBqZLNq/
	HTeLyNdtQWx1Z9ESV9C32o3SLbU1UMlu/Uz+U3A=
X-Google-Smtp-Source: ABdhPJwHFqWSQVHQU+m7cUBVWTkRd1EEjnifwL2VHkKeWPJzyVwKYbL9Va6Fwxy2p8reB0hTe6Q4zylBqS8xfnXnJxQ=
X-Received: by 2002:a63:fd12:: with SMTP id d18mr142202pgh.129.1630614298974;
 Thu, 02 Sep 2021 13:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902111339.GA577108@panther> <YTCU3SpFgyFbxXs3@kroah.com>
In-Reply-To: <YTCU3SpFgyFbxXs3@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Thu, 2 Sep 2021 22:24:47 +0200
Message-ID: <CAPGkw+z5b52n7rjHH3_LtH5tmt66ZBvqpbiGTj430Ncqv2ZcBw@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, I use nano. I don't see my editor asking me to wrap the changelog
text? What exactly can I do to get it properly line wrapped properly?

Best Regards,

Krish

On Thu, Sep 2, 2021 at 11:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> > This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
>
> Please properly line-wrap your changelog text like your editor asked you
> to.
>
> Also, your subject line needs work, look at other commits for this
> driver with:
>         git log --oneline drivers/staging/mt7621-dma/
> and notice how they say the driver name and the subsystem.
>
> Please fix up and resend a v2.
>
> thanks,
>
> greg k-h
