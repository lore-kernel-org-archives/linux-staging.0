Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07318F
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 17:10:20 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id g5so28649180ybg.11
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=st13mJuSkkLLd32MNsEtbcrb0dlPB41H5qgInX0H9Ck=;
        b=TommpFC5Soi7b4uD9M2oEetvhtEt+UCAbLRoLIjRsaP2Nk0+sxzCakEkeI2zA288hU
         ZbcEulYLvrnyC40LHVDTO4u1EnUeKb+rLrSfxgPH3SD1SMt7fvAKgsg0HqHVEjhb452E
         gDer54IMky5E3tq2Li9f3yYWxfUpwjIuxXmlcTXlXWee6lRJqb9KNrP6jiLHp9FI52mV
         Z1ip3i6oIUf3deCPl+yGQ3eTGetJS9lnbGu5HbkjfxdROykmEOnBaK+gcIPyAepGexoz
         MYogNTNa4gPfLl9nC3A3IrnKqeGECCGDmJCjJbHyIQgogxBvy0OY0gxYZ6mWFQ0nyMIq
         UI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=st13mJuSkkLLd32MNsEtbcrb0dlPB41H5qgInX0H9Ck=;
        b=iF7wY2Z464M88nB88LCQj8uHYRdavE0EZSkPIeDlHg2FQ7zIqXjLaym14OFH5eoiQs
         4iIwB5yKbcd6A5KFfzemTVmW6fJ68JUW/3dGMFpXSNssxUaS/Dq4JpdbiHks23xa9j2X
         LaHCXztf2cWZxy7CEynLT7xLCLjjB3JW9zC0NgCnK4CISgYv5UivCWt4DorLjQNUkvNp
         KM0mV7NfgD8eRfBTh93V8e5Uw64XfwisDbFpW/ca/fawfFVNFfRWJqDPh/uVU0k8y1lm
         Rt56JaCD9hhOlIVrgJ+KtNNlo7A0GbqkY1kdo4f3bIi/KMQxA2t1NHn7gtQdqjm1cB00
         /VfQ==
X-Gm-Message-State: ACrzQf2ZZ/Kyyy/lBpszD0FxOSTLuy06IdR++9aP3E4T8VQ06vWzxzI4
	I/MYcseP5Bpmha7j8FN4nik0xAmb3pF3ULjoqFI=
X-Google-Smtp-Source: AMsMyM4SyrR/dl+FfeqUh2DlhFJJOL729BgaayleZBYbjxMRoKK3sCDHyc3lgP/i1Q0NBNxwyHopC4FF3A45umC7sbw=
X-Received: by 2002:a25:dfd6:0:b0:6af:fa4d:33f5 with SMTP id
 w205-20020a25dfd6000000b006affa4d33f5mr686627ybg.253.1663261819306; Thu, 15
 Sep 2022 10:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220914080016.67951-1-namcaov@gmail.com> <1a1d346e-be81-19a5-5cb7-8b5ac896d835@gmail.com>
In-Reply-To: <1a1d346e-be81-19a5-5cb7-8b5ac896d835@gmail.com>
From: Nam Cao <namcaov@gmail.com>
Date: Thu, 15 Sep 2022 19:10:08 +0200
Message-ID: <CA+sZ8B__mUdYxCBqzD4TGAKKcaa1FtLsrJCQD=b9aYBKJhZUTA@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: replace spin_lock_irqsave with spin_lock
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 14, 2022 at 8:55 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/14/22 10:00, Nam Cao wrote:
> > In vt6655 driver, there is a single interrupt handler: vnt_interrupt(),
> > and it does not take the spinlock. The interrupt handler only schedules
> > a workqueue, and the spinlock is taken in this workqueue. Thus, there is
> > no need to use spin_lock_irqsave, as the spinlock is never taken by an
> > interrupt. Replace spin_lock_irqsave (and spin_unlock_irqsave) with
> > spin_lock (and spin_unlock).
> >
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
>
> Hi Nam,
>
> I am lol ... my computer freezed (you don mind if I do not try this
> patch again? Please send a v2) ;-)
> I was digging for the log see below. (kern.log)
> I hope you can do something with it.

Thank you so much for testing the patch and providing the log. I think my patch
introduces deadlock, which caused your computer to freeze. My bad, sorry about
that. I may send v2 in the future, when I fully understand what is going on.

Best regards,
Nam
