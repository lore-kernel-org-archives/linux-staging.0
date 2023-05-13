Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6F22622
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 21:00:20 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-61a4e03ccbcso103404326d6.2
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 14:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684011619; x=1686603619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBW31pof8U7JTyTG4H9UR8Byn7pBNVG1sdNfQzahcps=;
        b=Q1pQ/R7O807K0QZcLpy/a2OsFtwWI/GTC+ZtCUcvSAji6ri9Ecu0DYWtxMyT1SUiAt
         4wOKSVUmO3yiybktUvj1aG+GsTTgnlWrDoYFYY1JqhX0Kq73QIakH/0whQz+6fHdXGjM
         jX7ky8cs8zdCWf6K7d1tGs4ktXItS/E6whtcNmBVwdbJwATXtD8hLzGmUzhWuEnibHjV
         4J009SDCubKfzomTP1kZBdM+WWkzcBO4yEalleqWWMytzLoeTeRk8y6+X4fCazsOxjOz
         Iej3RJ7i8s75IW8aCAuTkg9ihCaliRwqTbSVv23HdSA71oLDaa2rTps1/bbVwQcrKvtn
         AtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684011619; x=1686603619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBW31pof8U7JTyTG4H9UR8Byn7pBNVG1sdNfQzahcps=;
        b=eloEtmIfOwZE9d0BtmIF23Ft8vdHtoTrWhUOXUUWbBi8AWdE+ppvgE3U5x977n7ONZ
         cn31bDEdwcnIeIZBRcouhFd/X74yUYxH2plT14xGrDD7CACySRY9IF/LPjNKp/10aaO3
         IhOpy999OgZ/r8Rn+NLS2OElaIL+tHf+zNoLZR7RogsI4N2Ukia7M7LfRjAcwHD8siNo
         f2uR0CO/mEdMcWFix9ydgfAWHI3cVmYWEh59aloPLStbNOCI5obSrXbhgDnRk3v5GHx7
         wlZcNvjmmE2bUlCPxSiQzlZkLrwX3j2aCHcnAJteNEI8KMaxqAbL8RK1nfZ3UVxUM6NM
         yAsQ==
X-Gm-Message-State: AC+VfDyRnXCHYH5Tcl2TojJfHZg0fauQ3UUqATVyVNEhN0Os8pPVn53i
	zfTrq6aWhnfToy31RbaGuXBmmXpHx4xZ8zWZSQo=
X-Google-Smtp-Source: ACHHUZ6suIKuv3NjLUbdApii3uNgQoxsnjNnlmFrppV/65JRTdetReF6gcblQMdaqEsJspAHCiqlde+Tngc031xgJdY=
X-Received: by 2002:ad4:4ee5:0:b0:621:68e8:99a4 with SMTP id
 dv5-20020ad44ee5000000b0062168e899a4mr18306226qvb.8.1684011618996; Sat, 13
 May 2023 14:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 13 May 2023 23:59:42 +0300
Message-ID: <CAHp75Ve413+r6jE=h-n0tibU5xy5iAMfbB3H8MPpgjRD3bj-eA@mail.gmail.com>
Subject: Re: [PATCH 00/30] media: atomisp: Register only 1 /dev/video# node + cleanups
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Here is an atomisp patch-series to continue the simplification /
> exotic feature removal of atomisp. Specifically this series
> makes atomisp register only 1 /dev/video# node.
>
> The other patches are some preparation + follow-up work for
> this change, as well as a whole bunch of folow-up clean-ups.
>
> The cleanups focus on removing the various count / users functions
> which atomisp used before when there were multiple nodes. This
> is preparation work for eventually allowing opening the same
> node multipe-times, as is normal for standard v4l2 /dev/video#
> nodes.

As usual
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for non-commented and otherwise depending on your answers. I.o.w. feel
free to add if you are going to address as I suggested.

--=20
With Best Regards,
Andy Shevchenko
