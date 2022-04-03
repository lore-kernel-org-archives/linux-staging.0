Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106207A;
	Sun,  3 Apr 2022 16:29:29 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bu29so13266311lfb.0;
        Sun, 03 Apr 2022 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d2J0F/M8DIzyhTgGvxfaytAbecsNZqv35sEaJSm/sx0=;
        b=ENlukbJM0kdQRUlborIRKBAU/dBCcX4b5oHma468C8us8C0JDA2lFRaQxUZhIhjonM
         SvxkMaT0cbi3hgQMiwRZqUZfrlq/FJLqap1YiFqat0sr6bG3vDdDEPMveflyjsfcIgOK
         w4/ETqdK1k8ck1sA3WeABKSNILWWh6f+y/5KiERlMT2Q7CvRmL9i4FsTB0AE+KJg/iTw
         /vLm49MG6E7T0DcX5fLmQ7MljtweLCAF1XAAxqnpETTIRqELy1PGliA22pOPhCV5CO+S
         fUD/rBAiPojxhaFdZTlsc4Y+rpx90JfkSGVd7VZ+9hxjWeVIdvkjj/r7lZuopDeG+5Vq
         qzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d2J0F/M8DIzyhTgGvxfaytAbecsNZqv35sEaJSm/sx0=;
        b=biu04NFXJS7PGKWyuLooVaaR6zY+GEjSC0JpukAn0AGkez68AzOpcG3KsgaSCvtojA
         4aQzbCokC/n9UFl6YrbArwE1Fj/VvD0QW4j9yG3n7P7rGnAsot95wdDomdvggwbg/wW/
         AXrWTNfRd70y572gLw+0L8k/CzBxAO30EgCx5CBb1xc6yMY91GL5X/NRxO7YcKLQtIZj
         gffGwP3HJNoL3XbxHNwqu/km+OtWaxot3qUjQCF4KcaFjvEnHktkBpaNSDDkw6AKuU0o
         O7kzwLTDFGN60VULki3n2G4sM28dduBXO6Gm04Vdz2FBxAv/lMkDqIWQN3DdW1BwTqDK
         A0lQ==
X-Gm-Message-State: AOAM533mpchYlphQ/UMWaJZjv/TKIFDWTM4nbHPxtQIDVBNed7gxduCy
	rNNBaekRTonwuj546gLIR7NyRFzn1P8TDsuZT/LL+pHgBKk=
X-Google-Smtp-Source: ABdhPJzspbTWjthhK4DIGjLuINz97YrCBTm+yb0x56rItHjeruKN086joJ/vE7j+WHekkwUciZrHG4Jv+4PJ7eN69oM=
X-Received: by 2002:a19:7501:0:b0:44a:2f6f:3ae8 with SMTP id
 y1-20020a197501000000b0044a2f6f3ae8mr19313960lfe.143.1649003368137; Sun, 03
 Apr 2022 09:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220403155111.GA333187@euclid> <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
 <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com> <4ccc9ac3-c542-cd32-0cbb-7cdabbf0dbf9@gmail.com>
In-Reply-To: <4ccc9ac3-c542-cd32-0cbb-7cdabbf0dbf9@gmail.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Sun, 3 Apr 2022 12:29:16 -0400
Message-ID: <CAMWRUK7g7BqUL1NziBfbc6Epx7G8Xos47sKAtcimDZYmG-hVgA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 3, 2022 at 12:16 PM Pavel Skripkin <paskripkin@gmail.com> wrote=
:
>
> Hi Sevinj,
>
> On 4/3/22 19:12, Sevinj Aghayeva wrote:
> >>
> >> Looks good, but let's not introduce new checkpatch issue:
> >>
> >> CHECK: Alignment should match open parenthesis
> >> #62: FILE: drivers/staging/r8188eu/core/rtw_mlme.c:1645:
> >> +               if ((p->PMKIDList[i].bUsed) &&
> >> +                               (!memcmp(p->PMKIDList[i].Bssid, bssid,=
 ETH_ALEN)))
> >
> > Thanks for catching this. I wasn't seeing this in my checkpatch
> > output, and after some digging, I could reproduce it with --strict
> > option. I think the tutorial at
> > https://kernelnewbies.org/PatchPhilosophy doesn't mention this option,
> > so perhaps we should update it?!
> >
>
> To be honest, I am not checkpatch expert, but checkpatch on my PC shows
> this warning w/o any additional options:
>
> =E2=94=94=E2=94=80=E2=94=80$ ./scripts/checkpatch.pl
> ./20220403_sevinj_aghayeva_staging_r8188eu_simplify_control_flow.mbx |
> rg Alignment
> CHECK: Alignment should match open parenthesis

Ah, I see. You run it on an email file that contains the patch. I
could reproduce what you saw when I ran checkpatch without any options
on an email file. But my usual workflow is to modify a file, e.g.
rtw_mlme.c and then run "checkpatch.pl -f rtw_mlme.c", in which case I
cannot see the "Alignment should match" error. So it looks like if you
do not specify -f then checkpatch.pl enables --strict option.

>
>
>
>
>
> With regards,
> Pavel Skripkin



--=20

Sevinj.Aghayeva
