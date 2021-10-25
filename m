Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB0E2C81
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 05:59:40 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id o26so5913080uab.5
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RuvzlfukE67G/bE78HD8E3x3H683hittFC0ADYk7uRw=;
        b=KcV121LLb1pDqiLt77bJK4hpiIA0hrtOUBqVAM6bXlsoR3llEQ7ssfyI9G3E0R7Mzh
         T9hpOMaiKSr6J3VHZPyGsVxp8TMo2APZ6zbU7j5z8rBGkQqZ5IOz7xe0il9/D1/ZnHRL
         eUX0xG1auyUPcb7mf+73g3engf+nDI0IgHBMAaMzu6JEWZS7EyblPtlS0Ebrb+p+ixAo
         q42gf6gaSta65Z54VBpvLU5LTbOAVnPRvLw23vkqqvoGJJwKXa/Z6VeWVG/o/uplxukk
         r48Eo8v15f2f5GP2rFieNNtaZ0N+cWZ5Cvw32GwEYA7oqqiEhrWeFOdvGqNI9ye9htmp
         JZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RuvzlfukE67G/bE78HD8E3x3H683hittFC0ADYk7uRw=;
        b=lcWtoTQ8cLII5rTyrWaZPP7f+vhwozLOlgZcfvCPvR3GTtanLNIs/UhtdM1rfnETUE
         FGvnoai11xvcjPgsPh+bhjlZ4m9UW4bO1Tj/3zQH0QD31LOO7rvoywE8O/Aqeobt6Zhv
         i2pKki4CyFZDMbhAM1yXc276UttvJ8Jss/y3teK3EqIi5HzSzPT9hyhA1y5Cuh06OMYZ
         S4WXmwkRMslDSUorQAsbfxz1Wc7YWi7oRYViJJqUIwxGQ19BXDMqsgXPBvEsQrdimZgH
         b1n/2uVCTcfud4tgzb3KLRuaEqmEwvir7ao7OlugBrQElnsC2i/DO5TBfABYTqz/8zq0
         dXrA==
X-Gm-Message-State: AOAM532/R+7Nv7Nmup1GEH/WfVR8PHLy3I0I0xHvlF6sp2Mca074Gr9I
	lq4tj+7VVfGBL0mUiHCGM9ThCbHXXQvGd9OV07BxL1qVY2E=
X-Google-Smtp-Source: ABdhPJwsdOp4cCSEY1bbQtWY1Z9A4Zd8I18SwhsaZqFVSMXOETYlDz9xSK78B87f/yaOWiCYAtyq9FNufTilZK0MvB0=
X-Received: by 2002:ab0:ec:: with SMTP id 99mr13061856uaj.46.1635141579101;
 Sun, 24 Oct 2021 22:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 25 Oct 2021 07:59:28 +0200
Message-ID: <CAMhs-H_StRmvmRZKYdsWXsXBDY1-e0zF32OfsBHyOH=2hrXKvA@mail.gmail.com>
Subject: staging: ralink-gdma/mt7621-dma: some doubts about this two drivers
To: linux-staging@lists.linux.dev
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'd like to know if somebody is really using / has real interest in
Ralink/Mt7621 drivers related to DMA: 'mt7621-dma' and 'ralink-gdma'.
I haven't seen any kind of effort (more than achieve trivial
checkpatch issues) to get these two mainlined. Personally, I am not
using these in any of my mt762X related boards. I think these two were
added by Neil because he thought they might become needed for gnubee,
but they are not (Neil, please, correct me if I am wrong). I am asking
because I am attempting to properly mainline mt7621-dts and if nobody
wants to take care of these drivers I will submit a patch for removing
them and clean their nodes from the device tree file. When there is
real interest, a driver with the proper dts node can be properly
submitted.

Please, let me know your thoughts.

Best regards,
    Sergio Paracuellos
