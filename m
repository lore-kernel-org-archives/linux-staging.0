Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9C70
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 02:38:40 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id l70so10819398pga.1
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 19:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=+oDpeZ4j0Q9DFmXNX82+DBFJCZJqLdYMPzNEUa68hdk=;
        b=IOa8K9tVVVxrX/LEDpljs/uhegyaU7VIZuMoaAVZsjDvNrTugxJq9nCTiuCFBEeDd5
         3Y7xjzha2OTsAjBRw5pc7a6InhT3llpfUQiJemcPlQrchkqgC9UINiAob8LgJehEDr9Q
         nmFyzp/SwcJZVNkHQkt2yziclbsRlwso1ofxmByAJcS15BRIANqqokBlgpK4lHAHoquR
         AtiCPZFyfQ7TIzLWLEp3wiv9qdNxAUr4bcnq3S1LIIf+4M5+HkcigdsLrwpCn+fo0lqf
         X5ljjTEcCm6UfcJ2a7UMhZkNb9wlVPYhsg6f46u0EJfEY2QykQptftlowkzjQFtSEfhZ
         eYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=+oDpeZ4j0Q9DFmXNX82+DBFJCZJqLdYMPzNEUa68hdk=;
        b=deR+J/s86WjIeIoVYN7Gcf/kY9LnNdnn/VzQ/nHXG2n1vfrc6Q6iMPXBV8cHJiJrhM
         nn7IBm/5LTRCy3vAj7j6yYkAEj9au635IICIYIy8k/GhBwgfl6v4W/yoP7eSu8ol1Wkb
         aGcJht0tERhX6gs4iyMqmB1zL9GuGQhdvlryX1alCGF+WwTCuWJXjUS/k3/FxIAOsvQW
         hP7KuQIRu94jA8vt4kgGiZywjz5hEPReWE6Dw7IrxOGQw5pQo6QGDH9d8rFUa28WDnrn
         ngjRSGAISCr4LElCwTvh/66h1rHdj4Pdy65VYlu+AcBQJGeuZndn0ZFC6OEhcUvgMUUI
         8GlQ==
X-Gm-Message-State: AOAM532BdbZ6CkVfXlbnI0T6D81Mw720gnzyUxJDnfzkVHSSWhozLKCy
	SRbl7y3cBWIBETDcffwxeU8=
X-Google-Smtp-Source: ABdhPJyOZjPeKhwYF/NBTz9x78DTVIhWw9ru81FqoCQB8kQAgbM2mwi2ZnccQH72pofVtqTXdW8LxA==
X-Received: by 2002:a63:1e64:: with SMTP id p36mr2226330pgm.105.1621478319924;
        Wed, 19 May 2021 19:38:39 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id v9sm3005387pjd.26.2021.05.19.19.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 19:38:39 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	Weijie Gao <weijie.gao@mediatek.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next v2 1/4] net: phy: add MediaTek Gigabit Ethernet PHY driver
Date: Thu, 20 May 2021 10:38:28 +0800
Message-Id: <20210520023828.3261270-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YKW0acoyM+5rVp0X@lunn.ch>
References: <20210519033202.3245667-1-dqfext@gmail.com> <20210519033202.3245667-2-dqfext@gmail.com> <YKW0acoyM+5rVp0X@lunn.ch>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 20, 2021 at 02:59:21AM +0200, Andrew Lunn wrote:
> > +static void mtk_gephy_config_init(struct phy_device *phydev)
> > +{
> > +	/* Disable EEE */
> > +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> 
> Is EEE broken on this PHY? Or is this just to get it into a defined
> state?

As I said in commit message, the initialization (including EEE) is
from the vendor driver.
I have also tested it with EEE enabled by default on one of my APs,
and got occasional link drops.

> 
> Otherwise
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
