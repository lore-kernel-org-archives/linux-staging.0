Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1FA47
	for <linux-staging@lists.linux.dev>; Sat,  7 Jan 2023 21:02:50 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4c7d35b37e2so9479797b3.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Jan 2023 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JmL5h/5f9ZKkHhV7ji7KKVGJQTUq0yPHfnhiMRhXed0=;
        b=IK5dGKTx88W2mfNkdSbqWACqkjubhVS9N14mCOb6xiNrTRTmnuplQafYC0im+wGspK
         eOYeaF0MULlk8xs1MhOKyABR+2n5mu7ywO33aNQ9VX4GMkdSdCVqflFNfkdkPvE907aV
         AbMRlhdfsnbXDXTGbNIAQfaGPRPsPMo8biAT31OQE9sPB82/31f0is5EfnCupoTz/Ke+
         5qPrTwyq0HpYK24udJ89pRlkE2Z5QaSlpexv9uCe2Y49IpPc0IVSTp5co8YZkKYLFYOl
         z+xqA+ASKB1ZQdTTr7sECFdnwcqnzJz4QBV2ycEBNoSYjk2aEYooKDaJopPZvE6w6Z6k
         Ar3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmL5h/5f9ZKkHhV7ji7KKVGJQTUq0yPHfnhiMRhXed0=;
        b=UytvHN9FD/6C+XdXXIYkNd0v8/gc2jxyAp/w2OhEeyLbxo8rnOn2k6fRh03rTI71zm
         FEg7Fdt9HdHKrOIzv3hRZPgF500rDPuyGoHpyMBR2ArOPNh6p9JsKNFGSz/bN1e60ahB
         FIqMpiCiKfh2ASj9gd2vtDyBHTtiq0b2a97w9k2jNdGiMbM3h+uLdN+hqh1aRlwPVWnR
         1TXhYq3d3AnB6lnqdlatnYx/79Xb9uGIeLTfpBu9n7uybmvn+Krieugz6uOVtERRilil
         q6WU6tPIa7vD82Y/XsoQp/xr26QGM/k3c/d6pVbxgOZumSY8zcg7gRbz00WtFwwKb0E/
         HAOg==
X-Gm-Message-State: AFqh2kqTT9/18jNKPxtiQhx+To3SzFkaXLskm40o5M7fG0copdurs6NO
	5yjGscpnYk3FpIhsB9JhCsg/3+WWp6+ZbRiE/6I=
X-Google-Smtp-Source: AMrXdXvY/st+xuDrW4znKkHpZttsCvsZGZkx5Bw3ldG/KbixkSHtRzf/+VMAvkN/c9NxoWqjkDvGG4OpHXXkd75XJ3w=
X-Received: by 2002:a81:484f:0:b0:3ed:90d2:2ab8 with SMTP id
 v76-20020a81484f000000b003ed90d22ab8mr582273ywa.67.1673125369382; Sat, 07 Jan
 2023 13:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 22:02:38 +0100
Message-ID: <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce backlight_get_brightness()
To: sam@ravnborg.org, Stephen Kitt <steve@sk2.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Antonino Daplas <adaplas@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin van der Gracht <robin@protonic.nl>, 
	Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:
>
> Introduce backlight_get_brightness() to simplify logic
> and avoid direct access to backlight properties.

Note: Stephen sent this one too a while ago (with some more details in
the commit message, which is always nice); and then he sent yesterday
v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
[2]).

Anyway, if it goes via drm-misc, feel free to have my:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Though it would be nice to have Robin test the change.

Thanks!

[1] https://lore.kernel.org/lkml/20230106143002.1434266-1-steve@sk2.org/
[2] https://lore.kernel.org/lkml/CANiq72kRhmT37H1FAGYGny83ONYXeqJuO8ZPbym0ajQOWKY4Kw@mail.gmail.com/

Cheers,
Miguel
