Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C6829CA
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 12:38:29 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id d4so3823966uak.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0vConzKPLEXeSY5isEj44b9ioB3WiTKXOOeH8M/qhMg=;
        b=ZOd3cKON6cosT+oUHSUoX8lYXRB1ivz8ksbhrz2g13ab681NxxqUYouzoyOdApRjHN
         9C7G3gkXybIsaQK6CR0OXJbCoityPI/bsDx9cxeBDryg0SrTlJdsGYQHAjRZcFqHNnep
         w8T/bY5gwyKErMCiBenZMnLf2a/1lO38d9s9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0vConzKPLEXeSY5isEj44b9ioB3WiTKXOOeH8M/qhMg=;
        b=LTPL9yASDG4ESj3uFEZb7UwN3lHJKru9xUbooLTzSiKkyVX1a7IeEYkHpeArhJEVkl
         olRCorcEbKz5uJOafy3POHhZKIwpoYf7stj77zasGNFCUiqW200sjaw1zFr+XVvZdoGu
         YKvJYGXor2RAgBRnpdqHdxqcUqngGegsAMDki+A8vjexdWB9pGrSeTMhy4b4HxJIU0Xt
         Q+VCXICR9Hb0TmSsMcsM58/vbXimMHkpLl07kRdicoDKs9S0+YiJiSe38AxZrirdQlLc
         plcMBXdCNXhqSHg0YD0TVA+OgTyZa430BnQoCiM6jo3acKZ8e2TqmUaa69E+lPhfNO8F
         UXjA==
X-Gm-Message-State: AOAM533ktMItV5SoZ2Kh1d67/DvnwBIz4XxxYLk4UUVKrTv49cyQHoXE
	gNc9RwK8iJBc4CS99U/3BJ20HXLy15zkSj6AQcr8IA==
X-Google-Smtp-Source: ABdhPJwWiK0lSKm+XTwl96Bf3/5KQdNtghCcUqgRmYvdz8qjWXlQJhdlhbS1vXZu/Mk2fnAln2bQsGBTgBZfLDmB4Dg=
X-Received: by 2002:ab0:10f:: with SMTP id 15mr3588186uak.113.1631795908405;
 Thu, 16 Sep 2021 05:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 16 Sep 2021 21:38:17 +0900
Message-ID: <CAFr9PXkpEDfa_P_UfTCwrBHOMsqyGm8MQgOsY=_OjFGc4+ApAQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] staging: media: wave5: add wave5 codec driver
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl, 
	kernel@collabora.com, dafna3@gmail.com, bob.beckett@collabora.com, 
	kiril.bicevski@collabora.com, Nas Chung <nas.chung@chipsnmedia.com>, 
	lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com, 
	olivier.crete@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi Dafna,

On Thu, 16 Sept 2021 at 01:23, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The wave5 codec is a stateful encoder/decoder.
> It is found on the JH7100 SoC.
>

For what it's worth; I think this is also the video decoder block on
the SigmaStar SSD201/SSD202D (32bit ARM..) that have some limited
support in mainline.

Cheers,

Daniel
