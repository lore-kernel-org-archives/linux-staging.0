Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B331FBC;
	Fri,  3 Feb 2023 10:28:17 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id cr22so4890692qtb.10;
        Fri, 03 Feb 2023 02:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OONFnhP6I7zS1Y45r5yPBZWg15dDNXvDl8f/Zu5HTcU=;
        b=2VSaYIBSmEp27JjHcU0PzX4vs0MHnpAKTHWSGNcpxHKlzoSnMWWVffjVgVyGpKU4Ka
         QXiv0P8mKtCc/BA+KHn+KFEFoR37idS0An4OQxO2e/Ss6MpXivCKQoO/Bz0XzTrmEoCL
         D+dZGsPOzYDNFcvdd71v5Vjw2xFKct7wS6xAYmKVD+5ZAwX/DLpAVHMbHjwJY/nbZhKC
         av+Hxdbdz13K+oVRSkOm+CaE5dtYgzYY5o6B+PRpvjFQJ85R0HLS7zIM14Fojc3zx37A
         Zky7I+JcZK9iAaJqnSl5a6eP2sdzHOm/G/CoglS11X6iin0SwpHY4CCUGpELz4uN01RO
         3S7w==
X-Gm-Message-State: AO0yUKWlvkALs7rRNQrvGfBm7VFZ0Bdk/WkfWVUhRj1Li7YY1J3U5KIL
	93fdTAAdp/Syzoch2/AAAkgASMow0jmjGQ==
X-Google-Smtp-Source: AK7set9WaQIV0/AXpCuazRcZjGWTto7Bix6tm4u/k9JQYtMkBYC+PVxLXApEv4JUCL4bXBNwQCU9Eg==
X-Received: by 2002:a05:622a:345:b0:3b8:6a5d:cd97 with SMTP id r5-20020a05622a034500b003b86a5dcd97mr17396964qtw.34.1675420095995;
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id g15-20020ac87f4f000000b003b86b99690fsm1345603qtk.62.2023.02.03.02.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id d132so5690538ybb.5;
        Fri, 03 Feb 2023 02:28:15 -0800 (PST)
X-Received: by 2002:a25:820a:0:b0:7d5:b884:3617 with SMTP id
 q10-20020a25820a000000b007d5b8843617mr1035225ybk.380.1675420094927; Fri, 03
 Feb 2023 02:28:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
In-Reply-To: <20230203101624.474611-1-tudor.ambarus@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:28:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> The deciding factor for when a/an should be used is the sound
> that begins the word which follows these indefinite articles,
> rather than the letter which does. Use "an SPI" (SPI begins
> with the consonant letter S, but the S is pronounced with its
> letter name, "es.").

While I agree with your pronunciation, I believe the SPI maintainer
(which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
with "spy" ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
