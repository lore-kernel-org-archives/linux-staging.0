Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523481B93
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 09:02:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r13so7765496ejd.5
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q0pr84jWpyF9HF9IcRwnJxsXg1/1KAMzdTSZaMqOal8=;
        b=JpV6XImnUXt0JBK3uECq/IbXisNCPGUDkVxFm1oUDxZGw7Lp4u7CaS3VIzVd+8rNuT
         vGZP8alBTGp0iq8GkX2RsYNAsiBvU2nbP4Zerqjl0G3u5G1KshAXsQA8TD9vaRR+GQwn
         OC4XQdAhcIcJZ6Tm3rqiU48z7sLpzEF/EJNAmadEG2F8VTK4qVH9j8MR+6VfLZazc8I+
         I2cqmNDemTVBF62QHwgtDQESNNuLoiARKsQtwIPJ3ov9nMQiuhhMXebo6JBWClBDIop+
         05xrWcGGPDjDrwBplIAcoOmWADIQdpHDPNAw+d772sSTpcGnhUff42Ma8s2WCyGDrLW5
         Ommw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q0pr84jWpyF9HF9IcRwnJxsXg1/1KAMzdTSZaMqOal8=;
        b=oIKK8V4h8x2hfRjLDSuxZSV37tnXLAvOYWKv+rIIbTwXBrCw3vk8QFE46wVd44Dk11
         sjerqaap25rhRVh7lh9TpLztk6aE/VejEMWIiV+4jSwBe/bNZXq2Pd0MsRwE4t0fxDyo
         MKXQXjZCQvsnFrkg/IUAM+OO2vbB+5Zi5Cqh1juIFQymGJNr1nAoQxx9amadIAVASIJ8
         Wz6O9qfS0yRlqHzpsswOZFW43RQws2uhhG88//BfzNfwx0o1TqJwKfM5PpV/9uDlFrp3
         ++1Yso9c0DyKOApMbXBWmVi4jlO++TyOTgSSCxIeK1MSd5EddaAUzJoqNgm3YfbvP0zJ
         vHyQ==
X-Gm-Message-State: AOAM532vNzJutysGYIbRtmP4t2dbDOYaqW566YF/n06thIT9rdFE/dJd
	++KsS/D1QGW3i/lQp15F9gk=
X-Google-Smtp-Source: ABdhPJz19UiVU80Rfr3Z6DeD0tq7NFWcSb99BErADW6wIBDasVfcz8nDtYbaLXZY1IvAHS88OkVrrw==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id o14-20020a170906974e00b006bb4f90a6aemr4734153ejy.452.1648112546535;
        Thu, 24 Mar 2022 02:02:26 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id gl2-20020a170906e0c200b006a767d52373sm836331ejb.182.2022.03.24.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 02:02:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sathish Kumar <skumark1902@gmail.com>
Cc: Sathish Kumar <skumark1902@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8712: Use completions for signaling
Date: Thu, 24 Mar 2022 10:02:17 +0100
Message-ID: <3422492.iIbC2pHGDl@leap>
In-Reply-To: <20220323045515.2513-1-skumark1902@gmail.com>
References: <20220323045515.2513-1-skumark1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On mercoled=EC 23 marzo 2022 05:55:15 CET Sathish Kumar wrote:
> r8712_sitesurvey_cmd() uses a variable to notify r8712_SetFilter() that it
> has completed operation. There is no sort of assurance that the variable =
will
> actually change and it could cache the value the first time it is read and
> then never update it for the whole loop logic.
>=20
> Use completion variables because they are better suited for the purpose.
>=20
> This patch fixes the checkpatch.pl warnings like:
> CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
> +   u8 blnEnableRxFF0Filter;
>=20
> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
> ---
> Changes in v2:
>   - Remove the "bln" prefix
>=20
> Changes in v3:
>   - Replace the variable used for signaling with completion
> ---
>  drivers/staging/rtl8712/drv_types.h   | 3 +--
>  drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
>  drivers/staging/rtl8712/usb_intf.c    | 2 +-
>  drivers/staging/rtl8712/xmit_linux.c  | 8 +-------
>  4 files changed, 4 insertions(+), 11 deletions(-)
>=20
Hi Sathish,

=46irst of all, I must admit that you have impressed me :)

Aside from the specific code of this driver that I don't know and aside
from the specific problem that you've been suggested to fix, I see that
you have been able to research and understand the subjects that Greg and=20
I talked to you about.

By reading what Greg wrote soon after me, I believe that he was expecting
a slight different solution. I suggest you to read carefully what he writes
rather than what I write, just because he has at least 20 or more years=20
of experience than me and because I'm just a spare time type of kernel=20
developer.=20

You chose to use wait_for_completion() / complete() (notice that these API=
=20
use barriers indirectly). What I can say is that they look to be suited for=
=20
solving the issues that you have here, even if there are other approaches.

Since, as said, it looks like you have understood how to select and use the=
=20
one of the API that were suggested, you have my...

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

=46abio


