Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2062C80
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 10:09:00 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id s1so9637036vks.9
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KxuN9XUUMW8gZ9VWagInIzYpVNdqq81IIENwDXx0fOY=;
        b=sP1fiPXTUMJoNGskvKjjtSoGqquXQU21deizBbg70ItZf0gfJkisFdQOVvZ/ys7r4Q
         SHHCCKR9T78NVKyuPYXBWEguESlSjfflJRWrKiIqfssQQFz7WdfyzP1jBZKgJ6DzfOch
         NbaV8467W/9J4QvAsTBzPKCiQB4NxWBiSgJm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KxuN9XUUMW8gZ9VWagInIzYpVNdqq81IIENwDXx0fOY=;
        b=ABDD+WiuraHM0lJ126sVUqyN/Gcp8toy3kSV7HJ959/XudoPg05AiuhMjK33epC5ys
         7ZMpIW6vTsEe0ZtAsSAxMCEozXupD2RbRkJWJXLauAVOqEzdeeTZimTQw+gjZGtmT+1Q
         OkJklmv9XIu9E4l20HBXpOvBDmf24OhpvEccz+vBDN3DrJZz/X0mRR7epU7sJ9lZInFN
         S5cz89VXq6bD10SqvQtWmKXgYLV5bxFDACM+GU8YuxO8U/OD9PxzwJ19XSIOqqpXMHD5
         Nya1soaax0DSkFTjIXhvxO43/2Df+PP5wKE5pxtdh3gXQJgCLAhNz/wYy5me6ttzsJxz
         EXaw==
X-Gm-Message-State: AOAM533F0eruA5KNa5xYhfbAiTZ5+aZduXYTIlAR5sBRTvSpUFmAvm8X
	1ATm4GliS2W8kNXHxe6CsCxbFTe5E6Mue0c5/oKcVQ==
X-Google-Smtp-Source: ABdhPJy0QfEolltcqqlYNbGRBgDMA/8lo3xhFobs++B2pW2+9lgHiRtlqmqQTR+L7HkU8xSlfezN+dEBQzfYY32Jfsk=
X-Received: by 2002:ac5:cdad:: with SMTP id l13mr14112277vka.39.1638439739151;
 Thu, 02 Dec 2021 02:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211201175613.13710-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211201175613.13710-1-dafna.hirschfeld@collabora.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 2 Dec 2021 19:11:51 +0900
Message-ID: <CAFr9PXnvbqtx-SpxjyO2uvoBR3ueNBD9vSFnbqjbAHz_7Lh8VA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] staging: media: wave5: add wave5 codec driver
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl, 
	kernel@collabora.com, dafna3@gmail.com, 
	Robert Beckett <bob.beckett@collabora.com>, kiril.bicevski@collabora.com, 
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim@chipsnmedia.com, 
	scott.woo@chipsnmedia.com, olivier.crete@collabora.com, 
	dan.carpenter@oracle.com, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dafna,

On Thu, 2 Dec 2021 at 02:56, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> Testing on BeagleV shows buffer corruption that is currently attributed to a
> known silicon issue in the SoC that makes the cache coherent interconnect not
> so coherent.

Maybe it's mentioned somewhere else and I missed it but would it be
possible to tell me which version of the IP is in the BeagleV chip?
The reason I ask is I'm trying to get this going on the SigmaStar
SSD202D which seems to have the "Wave 511".
I can see the firmware binary get uploaded and it seems to do
something as the register that exposes the vcpu program counter is
doing something (and the addresses look the same as the addresses seem
when the working vendor kernel + binary .ko are running so I think
it's not just running garbage).

I'm wondering if the BeagleV is a different version and the driver
just won't work as is on mine or maybe the firmware I have has hacks
for the vendors version of the driver which I don't have source for.

Thanks,

Daniel
