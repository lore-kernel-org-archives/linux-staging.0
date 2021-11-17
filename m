Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE972C82
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 16:31:20 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id z26so3943356iod.10
        for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 08:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7zHOGQu7d9UeXQhsg66T+H2WP9bUtQkG1kAiO3IvJz0=;
        b=fZwAqj4dAptl4/uCCWdAnPEsjBue+dWlInvK/6fwRPmDZfUrN7ofm3mESS8VRLViM8
         oB7/r3fFSZ+CEmdvLHSuxTou1bjhYiAl77Xst70Et+xB7AgbYi5zd1fnr5tTdBs15Btk
         /jl17p/0AtejZMqS3Ua59kREhoBQxSDthd+l2sTisEldTBdVK3Vt+59eu6UtTRhSPDZH
         CeAkCir9xU5N8TlDaiHOvO2yw0ozSe814pegweUlh3puFJ7FoTLZ3ybCpZepAE7y0F6i
         PhjMRDf1Y3Ftq3+1fYa9YVJtLPxzD0tZYsTmHxq7oiesXkaVUckCwRb4KzoYakgzzkJD
         XJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7zHOGQu7d9UeXQhsg66T+H2WP9bUtQkG1kAiO3IvJz0=;
        b=3GlEiolvo02pvHaG8pG4Bm11xunbGF/G/QJh0GotTJo18TaqWNYMbzHgXrKEAEqNro
         2mVsaFFWYCuga1A93zn6Xig099zsrlzRIj3TlkLcba+y4Ye5hr4JdWBrSvkZCFfrDivs
         SQLOiGQa591Dh1eAJVIsc2pceXS1JaUXx6jPx9QQdrIIeJbsF+fVhY+szFR5FV2Zsj5S
         2f2nhuZ3yiRyEPVxhTv8uMpPuaiwqjcceCBtsfNQKJ2uso2NJu9ep9FoyKwUK4lJa7bs
         09fpv2vLiNArDOCJZNtHpzlvxE7wNoC1XT7i2Wg14rT6EGYrCLzoQ8EUZRislhQocMiM
         +imQ==
X-Gm-Message-State: AOAM5323icCoIk7mtrOtxOdqk5R+Gpppk5FxurmjkdtKCkSW2PGsCOm7
	jbu36rRgXn5XzawQ0gmaZZW/NuOXDhHJu0mvNti07+Rd9dE=
X-Google-Smtp-Source: ABdhPJwaK3uBtAF2PDBfk81y0f/ROxCv5ZiJu7X9PEoWw+OxD5fLPJVsQdghM0lVUZoZlgB4snp2ZOgKt77zl6Hm5LI=
X-Received: by 2002:a05:6638:3795:: with SMTP id w21mr14368122jal.73.1637166679432;
 Wed, 17 Nov 2021 08:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Zameer Manji <zmanji@gmail.com>
Date: Wed, 17 Nov 2021 11:30:53 -0500
Message-ID: <CABtXzjQ=8KcNM2uMRnd7dTxGvMKscdc_cbEnTuuqrcnfuh_dUA@mail.gmail.com>
Subject: r8188eu and cfg80211
To: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Martin Kaiser <martin@kaiser.cx>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I have been looking at the r8188eu driver code and although there is a stub
header "ioctl_cfg80211.h" for the cfg80211 implementation there isn't any other
code related to it. I noticed that both Larry's tree [0] and another
tree [1] have full
cfg80211 implementations for this driver.

Would it be possible to import one of these implementations into the
staging tree?
Migrating the driver from wext to cfg80211 is a requirement to get the
driver out of
staging and would probably make the driver more useful to users.

[0]: https://github.com/lwfinger/rtl8188eu/blob/v5.2.2.4/ioctl_cfg80211.c
[1]: https://github.com/aircrack-ng/rtl8188eus/blob/v5.3.9/os_dep/linux/ioctl_cfg80211.c

-- 
Zameer Manji
