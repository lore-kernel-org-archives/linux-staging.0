Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D55392
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 22:30:09 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b9defb36a2so2590866a34.2
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690065008; x=1690669808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5mJll+udYAOXh1dqyerngRmFpTg3nf1DZBJwkPP9FE=;
        b=fmBlKEPNTll7Q+ApeducTu+N4D5OEnPiqEyE3puoZ/f1QD58JAZi3eDATZeNITi4jM
         NfCgRpKG9YqZ7gTqit6ClJvIXxAk6p9bQG6pv0wRSvmMg6/61kNc8VHkifEP2v5aqsjg
         cQIdaTdDbMnzV+GtdSdip8WB6G+CpgJTfTVWjkqkUBB14+1nLPcBTPuMMwj1Rqqyunzc
         fJ/hBqVXc716JoOJbFu7BB3PgKyiN31fKUwHTqyLY87rTDz6TBhrrHyjVRBM5mxmqEA/
         UdrAVEnebIlMeTFvBVz9eydtQ+K6ptB6xhScRnBOHxGTVfzldVCuZrLojZqa5elrCdlf
         7+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690065008; x=1690669808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5mJll+udYAOXh1dqyerngRmFpTg3nf1DZBJwkPP9FE=;
        b=JcRc3nK2ah+0G/sa9L28W/TkPJoJ8MzwffaGdddrH9+J7pzL/dklxqxqG2iE12misp
         LzerxXa9VnY34UUWxZEAKSpV06PZ4n67BE//Zb2oyBtmvOdPS7ipUTE6+e0YzrRDrRfg
         EEXwSM6/lFAIj6DcWZ4+vZPs0G9kSXELUXi8wzvG4Nd5LGBlBVGGvHSU99DNbWuF/rf/
         0OoLp1Ggb/oMQU8QQYNC8mIgDdqO82GyaViiOBSSrPTKwi1xXlhVEpUfUHQJZKad1C7j
         eYv2qg4joXUDCGAxS/nKOTyoRCTFO1WH2jyFdd31N6OfM6rGpOgy9UTGxK2xMu+f7TvX
         96nA==
X-Gm-Message-State: ABy/qLYJ8e4wFtn1PicTI7ZqKLWxie7UAHIyvA3eW1ZMaw2PpC0DMMav
	As53rxg1WPSOM8TUmlYiI4yl8a0smTPB3Dn3GTY=
X-Google-Smtp-Source: APBJJlFCI6V1NvyiDmCqWK0vJJCL9x89CoMWJp9xHrtgspyjqNJyxayK/dkl5i6UuA6YH6Ew7ialEeiv9fv3vIHFAw0=
X-Received: by 2002:a05:6358:6f0c:b0:134:61a5:7f05 with SMTP id
 r12-20020a0563586f0c00b0013461a57f05mr1831945rwn.10.1690065008440; Sat, 22
 Jul 2023 15:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de> <2023070123-unburned-worsening-0713@gregkh>
In-Reply-To: <2023070123-unburned-worsening-0713@gregkh>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Sun, 23 Jul 2023 00:29:57 +0200
Message-ID: <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-staging@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	Emily Peri <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>, 
	Hans de Goede <hdegoede@redhat.com>, Kang Minchul <tegongkang@gmail.com>, 
	Philipp Hortmann <philipp.g.hortmann@gmail.com>, 
	Veerendranath Jakkam <quic_vjakkam@quicinc.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Am Sa., 1. Juli 2023 um 17:00 Uhr schrieb Greg Kroah-Hartman
<gregkh@linuxfoundation.org>:
>
> On Sat, Jul 01, 2023 at 04:43:09PM +0200, Markus Elfring wrote:
> > You should not put only your own email address into the field =E2=80=9C=
To=E2=80=9D.
> > Please reconsider the distribution of addresses between message header =
fields once more.
>
> Please do not comment on staging driver changes anymore, it is not
> helpful to anyone involved.
>
> greg k-h

Am I supposed to adjust something here?
As far as I understood, I can ignore the comments from Markus, correct?

Franziska
