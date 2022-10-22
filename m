Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24AC28F3;
	Sat, 22 Oct 2022 08:21:26 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id f14so3387708qvo.3;
        Sat, 22 Oct 2022 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8XCmu4eeANl3gUPR6NIj7yvs9tk1YzIUAXdrodS0x50=;
        b=CaTK8xgEp6jm46Ypv+4caVLKIUmW/lKmjKL1d8LQ+94iH+djTdChMUbSwP8PIDMeSI
         kIdHxTUsOJDJ7QT4Wl8G7ePG2e7Yi38NLdofrzg3tUCY8PBYvWrIf/yv412H1OhygW9j
         rjkBLDCiuvprqde3dlSuAsNbSh/gDJkohuuTsvKzg0wJbCjT/OtL2+lfLLcwchv1BItz
         bM8EJpfuvzaEiu6cRI/w3iNRmH4FXwIOvl2U0DEs6+jcDvCIbi1+1YiP5NICkoa469de
         VzJ3289elNfglQ6TUDOF9EaPC8xTqlC/l3PUS1geeLBT9JYVgx0ZTONTzGdZKf2lSvyQ
         Dfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XCmu4eeANl3gUPR6NIj7yvs9tk1YzIUAXdrodS0x50=;
        b=UyqYm4mINTmqfbPlTUlYg7QDIISK4rwo9iQuolauuR/MBBGc6JbMRqDKAGsk1YwE2k
         oPGCg2Y4Y0aDUxeFFx7z9jJZobcjtE1zFhSe+4AEnHeuz6oJJfEBtOkZqOZEbl5j5kC+
         N8TxiE0zOrNSnfDoUJHgIoZDk4E5D6GRdQBLLfrpzsqC5O6JR4qNPiKwuaGqrhNd4O4e
         D3iTedBALm0xdPHrKU/rhJ+D2EqfEUkgrpZrso1fyqnhMQVjTFxpPynhwBNpE2piuvp2
         44+A1ygrH1Sd16wBSqhjxsCpIHDbCu1iqemo68VKgftskBW9hXB+SB3JjW/C4nDXyWiC
         FO8g==
X-Gm-Message-State: ACrzQf3nKbecJHXTSP4YXdArccWEHZXSjD0ARSDAB60hQmQsZtJxZNxM
	OI4WPeXywLYx1cybwtl1bxneMQhnwdl9yB3bj/A=
X-Google-Smtp-Source: AMsMyM5D48G0cVp9t1wgqQ7DcnqcSdpMM104wFSVoxci7F80s/Dj3bVv3dKqC07wjHpTSY0eYahbAHeojcH34+PnL/Q=
X-Received: by 2002:a05:6214:d69:b0:4b4:525e:c987 with SMTP id
 9-20020a0562140d6900b004b4525ec987mr19999969qvs.82.1666426885758; Sat, 22 Oct
 2022 01:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHJEyKVi=Bw1=-cH8dbJratKw3Lk3ubh_9bcBB=iKPm5H7P1Yw@mail.gmail.com>
 <alpine.DEB.2.22.394.2210221013071.2700@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2210221013071.2700@hadrien>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:20:38 +0100
Message-ID: <CAHJEyKXxB0O+r3G5rEsWJJLPY4Ar5Fw9HSgZgyiH12oijV5yvw@mail.gmail.com>
Subject: Re: request for assistance
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 9:13 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Sat, 22 Oct 2022, Tanju Brunostar wrote:
>
> > There is a portion of the Outreachy first patch wiki I would like to
> > edit. How do I go about doing this?
> > - Should I just go on and edit it? or
> > - Do I have to make a proposition addressed to someone or somewhere,
> > stating what it is I want to change and why?
> > I would appreciate your help.
>
> It would be good to post your proposed changes to the mailing list, if it
> is something more substantial than fixing a spelling mistake.
>
> julia

Ok Thanks
