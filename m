Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72657B;
	Thu, 27 Oct 2022 14:25:20 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id 8so1006010qka.1;
        Thu, 27 Oct 2022 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GuDQalOlhKFsf9Yqc1jpknnU37kxT+pjhyntYc+6FYY=;
        b=MCHvetBoSau9DLlXXXOAwcfa59qdAXBdT4lmQDyRlJvfDA+P7lT/NjZHnWwHhJWlGs
         t5SOZ4uPguaiZEtUF0XIdeurImkX+E8TwjlRkt2uvMGIygfQvYWoJmTrypyQRboEMN3h
         37wjvX4bqyijupAFgNdQAuMRsJlKBh4AeYDRPkQkCU/Lqpa3QHYtfVv5daOOTZ6sPwgC
         jwS9HAnTUARzS6F5FQ30PJSNJJEGqL7tK0V1B5jp+1HlgB6Y0vlWRol30u6fTITuHCZI
         2vLtM1iFpD7tNyxU31fKDtjmGphDcAvCB0NBDRPQi2OKYZtlUek+rBY0sRgCucYK0sia
         nM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuDQalOlhKFsf9Yqc1jpknnU37kxT+pjhyntYc+6FYY=;
        b=Tlm9TFD69JTjVADxO7k/IX/qq8I1CR//sJFmepSP0yMOhP5pWTePhvkymrPD0FYPyN
         BF1qliNmmJTm5nhDIDOF3dRjtnsBcUKwn64QVdx8Op/lDhS0rWKwrm/33uYMIkM3R2Zl
         xJt8w1iMlxb9/Ke/NSjkl9ASkavL6GqLkk0VqsQnIEltEa2Oyz1bebb8zWfeWWwxPnUj
         6c+fMMKCXZYII1kU13Ia9EBQUZ2dGAo98TMyIVLzYQl90WqYs/fnPf0AV8xDptVvIYq+
         zY9UtQxkpbSnNLGFlwPlzR+d9uyy0sHhyaQStaTZM4GfrB5PAnc3VJ8WLvbPD4pNKtj0
         VJZQ==
X-Gm-Message-State: ACrzQf0aWmHx3a0a76fr6POa9y7iGakmnlEprKP3JWyiUtfQlpGGpA7P
	8sYqSP1rtWhzYlkn7njJmHHgEMxU9v2ugJAZtDk=
X-Google-Smtp-Source: AMsMyM5boG+qxOLp3PS/qK6jfb6JYFkNefj+69tRO6f3D+CFULxPe92Oy4MjD3ez3m0bn5FPi+y/23tRf3IVHewXpWQ=
X-Received: by 2002:a05:620a:2686:b0:6f5:723e:6316 with SMTP id
 c6-20020a05620a268600b006f5723e6316mr15104081qkp.103.1666880719656; Thu, 27
 Oct 2022 07:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <0e6a307052d3a354a850a502e509f46baccdbe1e.1666849707.git.tanjubrunostar0@gmail.com>
 <Y1pNJMvl89jgq9qz@kroah.com>
In-Reply-To: <Y1pNJMvl89jgq9qz@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 27 Oct 2022 14:09:52 +0100
Message-ID: <CAHJEyKVpK=BSkuM_RmJ+eUYApYJig8wfqDP4nM=cou_0mThHuw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] staging: vt6655: refactor code in s_uGetRTSCTSDuration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 10:19 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 27, 2022 at 08:59:04AM +0000, Tanjuate Brunostar wrote:
> > refactor long lines of code in the function: s_uGetRTSCTSDuration
>
> Please write full sentences.
>
> Also please read the in-kernel documentation for how to write good
> changelog text.  Specifically look at the section entitled "The
> canonical patch format" in the kernel file,
> Documentation/SubmittingPatches for a description of how to do this
> properly.
>
> Do this for all of the patches in this series.
>
> thanks,
>
> greg k-h

Hello Greg
the file does not exist in Documentations

Also, I had to make the sentences shorter because you said changelog
text was too long. Can you please give an example of a good changelog
text? I feel like I have not understood you.

thanks

Tanju
