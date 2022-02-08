Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9759C2F24
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 08:09:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id k6-20020a05600c1c8600b003524656034cso996551wms.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 00:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ikw43MPriiIAbjOZjzCbDdxoeo6GLo0YMTk+PKI0AMQ=;
        b=p/48KqgkBezydVHKW62KCOR7fRF5aZ8bJ7Vj5qZA5bfYwBfnfi9TKAhktIK8ngNClb
         HmXxYBa+RRqFIgbmP7+d33LkGWz9h4oC/59oQNIl7VlFGfjxUx1LSE3MHaFJxL84QKt3
         a8LJa58g9sCZZ8W6rYPptgncbvigRRvgAVtSi9cgoJjIPBuGbon+mI1cdPWcTkbYwmzB
         ojnUD8kWvypHp1DQ/0WWidUrV7BU5FDPVrv+LnJxJ+xH75SetzXU5jleezoEmlfpjle8
         Hyiqqhy7CaXehaLx7JMJcJdqGQhh2whEE2Wwa89I7tdsf4d/esyPXS2sNbaszS3h/AS9
         iscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ikw43MPriiIAbjOZjzCbDdxoeo6GLo0YMTk+PKI0AMQ=;
        b=vXuMxSAKVZPuOa2+lATzYnbuTgFTlW9Jzb2OE+E7NdLEIdT3qtb5HBWbM5LUphdU9x
         KV3ZhiEazK782j5g6xxkqAQ6s07s/N569WNZQ32uCxW3NtlmWTHvG8zE8DdW24xD9/fq
         suFh+21WfbHBMkEYVgX9DgE8v2osYE17j4NVxClFkUmXEI0zPUtprmvveEtipnZAd80/
         K/ou7c32B3E8/O6TKJCRgFlvXG5RIGn41NxwSTAkPVJGQrSsyK/WwVQZrdJcTqU9A7C5
         SN+Qh7htzEYVw43Mws52BSZl+xwGuNAHVFP144gdp0qRnadj6qwuAGAAmmFglg3MufM3
         L51A==
X-Gm-Message-State: AOAM532SNm5nGBoVp+iZWwuRkSFoQ2VH2wEy7WaxzPZL8hkLKoh1R527
	QkHxIE+HDTJ3o73cX5CX1YY=
X-Google-Smtp-Source: ABdhPJzByC8Qgzyw0Yz/LNKRPF6ZW1JT1tyJHCxE+8t8cF66Tkwl/xvUXqulqoZqdB4rwwrF0+a8oQ==
X-Received: by 2002:a05:600c:4f02:: with SMTP id l2mr21703wmq.115.1644307753769;
        Tue, 08 Feb 2022 00:09:13 -0800 (PST)
Received: from leap.localnet (host-95-245-2-16.retail.telecomitalia.it. [95.245.2.16])
        by smtp.gmail.com with ESMTPSA id r2sm1840146wmq.0.2022.02.08.00.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:09:13 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, Leonardo Araujo <leonardo.aa88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: Re: [PATCH] Staging: r8188eu: core: 'associcated' may be misspelled - perhaps 'associated'?
Date: Tue, 08 Feb 2022 09:09:10 +0100
Message-ID: <2122312.NgBsaNRSFp@leap>
In-Reply-To: <20220207234210.26097-1-leonardo.aa88@gmail.com>
References: <20220207234210.26097-1-leonardo.aa88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On marted=EC 8 febbraio 2022 00:42:10 CET Leonardo Araujo wrote:
> This patch fixes the following checkpatch.pl warning:
>=20
> CHECK: 'associcated' may be misspelled - perhaps 'associated'?
>=20
> Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
"Staging: r8188eu: core: 'associated' may be misspelled - perhaps 'associat=
ed'?"=20
it's not the way patch subjects are created for inclusion in Linux.

Please follow what is clearly described in the "Philosophy of Linux kernel=
=20
patches" document at https://kernelnewbies.org/PatchPhilosophy...

"In patch descriptions and in the subject, it is common and preferable to u=
se=20
present-tense, imperative language. Write as if you are telling git what to=
 do=20
with your patch.".

It's not my job to accept or reject patches for this subsystem and I don't =
want=20
to tell you what to write but, if I were you, I'd send a v2 with a subject =
like=20
"Fix misspelled word in comments" (or something else similar to this subjec=
t).

=46urthermore, please take note that the name of this subsystem is "staging=
" (it=20
is not "Staging").

Decide by yourself whether or not the other two patches that you submitted =
this=20
morning have to be sent anew as v2 with due changes in the subjects.

Regards,

=46abio M. De Francesco =20





