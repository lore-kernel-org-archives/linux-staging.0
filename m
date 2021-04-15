Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADCF6D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:49:13 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id t22so16574525pgu.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=MLJSeXjPoZhwM9OSDgG8lC1iJnB13aPm/yKl+/yfCV4=;
        b=pRp6PcDwdUPowwS48+n5Vcn7b/Qu7Q0Bq2YvCP3A8ZlqeThBV3w1DUWLE2e8USg8pm
         p56e0NTf8FPp/4keeaxSxU8itqoXcygZWccJHjzPYw6twkrPCaCeIa7t8UWAaOi13xiX
         Ve6vDa0hTMEKVIEsbLjuxRulV/n9kQ+m5aOD6Vkf6r2/Bwusr+eQ/S2dwwn2oMFwp3Lc
         2GkmtQYNPNgQcVe/+isx2vnEXxpY4KB3qC1LUVEX/QDmUFhh3+H3Qlnrawi6wO8qPSXX
         n9LXQW/2cwdJBiHYuTEtqQ1QFQjXIxdEl7Z+WptTF8OVwNjIWlQO0gCPwfl0HQmBLn9z
         KTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=MLJSeXjPoZhwM9OSDgG8lC1iJnB13aPm/yKl+/yfCV4=;
        b=rnlrDKX/G1OHZTnQWut5TxbZGKUGRid6IEa/72f6SpZr0fE0UfRMEpa8swZyA0upRP
         x34BmHCPstW9WQjwebiHONAyX18+gsrqb5rzjwkMlbFfRtmEzjufAFdgxnMYMJ6E7q58
         Y5NPPmwtjwEKUC9blWnEY3+5rhzTXhsCwnSBMAV+utlripYYLvENCX+dnOa3lMncGIfj
         ShwoJwlbrU32au0D5SoUJRnmmmA7cgKWIpgtyH+9Yxs5ERgs5+VXd0GstYvoJkOrs5Bz
         6R1aRPQJIGoaj81I8/wBHbeThDt7+wNO3oVzZei54t4yp52jc4QvzaKuTSGPa8wLjKaq
         eE/A==
X-Gm-Message-State: AOAM531FnbugvaG5qCcwDudVmp49QbLN6AFmYNplh7d8V64VJZO5Xc3t
	bhftaxppzNSFl6FCa4BTi+Y=
X-Google-Smtp-Source: ABdhPJz/296Ukvru+pRPqrOVz6BD93FwhsGWGwnliuGvZd2ixls4Ij1dvumbp8/IpFDe3RglPXeWtw==
X-Received: by 2002:a62:7d07:0:b029:21b:d1bc:f6c8 with SMTP id y7-20020a627d070000b029021bd1bcf6c8mr2278450pfc.45.1618480152634;
        Thu, 15 Apr 2021 02:49:12 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id g10sm1581765pfj.137.2021.04.15.02.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:49:11 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
	Frank Wunderlich <frank-w@public-files.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
Date: Thu, 15 Apr 2021 17:49:02 +0800
Message-Id: <20210415094902.2946-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413131259.GP1463@shell.armlinux.org.uk>
References: <20210412034237.2473017-1-dqfext@gmail.com> <20210412034237.2473017-2-dqfext@gmail.com> <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com> <20210412150836.929610-1-dqfext@gmail.com> <20210413035920.1422364-1-dqfext@gmail.com> <20210413131259.GP1463@shell.armlinux.org.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 13, 2021 at 02:12:59PM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Apr 13, 2021 at 11:59:20AM +0800, DENG Qingfang wrote:
> > Within 12 hours, I got some spontaneous link down/ups when EEE is enabled:
> > 
> > [16334.236233] mt7530 mdio-bus:1f wan: Link is Down
> > [16334.241340] br-lan: port 3(wan) entered disabled state
> > [16337.355988] mt7530 mdio-bus:1f wan: Link is Up - 1Gbps/Full - flow control rx/tx
> > [16337.363468] br-lan: port 3(wan) entered blocking state
> > [16337.368638] br-lan: port 3(wan) entered forwarding state
> > 
> > The cable is a 30m Cat.6 and never has such issue when EEE is disabled.
> > Perhaps WAKEUP_TIME_1000/100 or some PHY registers need to be fine-tuned,
> > but for now I think it should be disabled by default.
> 
> Experience with Atheros AR8035 which has a very similar issue would
> suggest that before resorting to the blunt hammer of disabling
> SmartEEE, one should definitely experiment with the 1G Tw settings.
> 
> Using 24us for 1G speeds on AR8035 helps a great deal, whereas the PHY
> defaults to 17us for 1G and 23us for 100M.

I set the 1G Tw to maximum 255us and still got the link issue..
