Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E45F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:09:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j7so16665772wrd.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=9ThliA+FvSjJnPMsRGQJR0DXPnljzshwYzvzpSyvF+c=;
        b=eST1rx5pYBZBo/SJwOB4iGdVbOnpbbgr7b+UtyCV7EcDVPVUmTQm/CbPdWiymvYVig
         aJHv/uQFKDdY2FUyzO8X0g/oJ2g2tIuMmNCECYaEvHi0Qh0b2d2pZTTVYSsYNYzK8T4t
         bf2eotINOSp0ZiZXeKdLeOBo0yuCyBoCdI+3bfWotKnTWlun7MED1dfEL1MOU8QxsGug
         YpiVwbwwhdi2jhvdZNBi8A2AmbJBtPi3YIRpOqtDqH2V+IPtvRXCbyhmsQVJ+nZlgQe7
         d6B+HwqgNxYMab2M/mFiNqch3PgUi+vv7RC1cC+a7w4ZEWvQQDxEFqTpq4Vj19x3J8jZ
         K+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9ThliA+FvSjJnPMsRGQJR0DXPnljzshwYzvzpSyvF+c=;
        b=LB2jTd16QTty/8yW3WGHUCV5etJ4nICA0R/4JrKa4tQf/SqjyUx4ZmHf3orv2c1HaH
         d/JWgy9Th9kfx27Et3yImhxK6UVe1gRx8ZOtY2O0h3WXlku8dyt8E/JYF0ZGwGmRcxvO
         g/BijA0zLIFLOnlqMHGOQivBo2bpqfpwMnwxBKysnHxKmPI4zLefDApUB/9zcw+LUucy
         lRMbKJONimPRAI5pGZY9n45vlKUZ9YeWyfSrglw5tpPYejY1MGf4CYOx+svFd4TMruUd
         7ZSJf95pOXbe2ifadXvgSuYZf4gvswfxVu0qTLfhZw84sNhL2g5/fzbo4uCetKPATyQV
         qXxw==
X-Gm-Message-State: AOAM532sogD6bidYJ6nvrivZT4vZsDWmVoPaGW8IDqtniDmM+TYYXW98
	gCHL9VVo/iXncdLZbwfV6i8=
X-Google-Smtp-Source: ABdhPJzRA8gpt1MA7GkLb2yVGM7qexAa1iYL5d/n9eYkBW8XoIOoVD7D8U6gwpzcaGAQk71LknunXw==
X-Received: by 2002:a1c:3d8b:: with SMTP id k133mr16067134wma.6.1616418552270;
        Mon, 22 Mar 2021 06:09:12 -0700 (PDT)
Received: from cesati.gmail.com (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d8sm21261834wrr.35.2021.03.22.06.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:09:12 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
X-Google-Original-From: Marco Cesati <marco.cesati@gmail.com>
Date: Mon, 22 Mar 2021 14:09:21 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: Staging: rtl8723bs: proposed patchset: remove useless structs
Message-ID: <20210322130921.o4voti2xkmbxonny@cesati.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The staging/rtl8723bs driver code includes 83 unnecessary struct
definitions (never referenced in the code). Here there are:

cfg80211_wifidirect_info tdls_info tdls_txmgmt P2P_PS_Offload_t
P2P_PS_CTWPeriod_t usb_suspend_parm getbasicrate_rsp getdatarate_rsp
readBB_parm readBB_rsp readTSSI_parm readTSSI_rsp writeBB_parm
readRF_parm readRF_rsp writeRF_parm getrfintfs_parm settxagctbl_parm
gettxagctbl_parm gettxagctbl_rsp setagcctrl_parm setssup_parm
getssup_parm getssup_rsp setssdlevel_parm getssdlevel_parm
getssdlevel_rsp setssulevel_parm getssulevel_parm getssulevel_rsp
setratable_parm getratable_parm getratable_rsp gettxretrycnt_parm
gettxretrycnt_rsp getrxretrycnt_parm getrxretrycnt_rsp getbcnokcnt_parm
getbcnokcnt_rsp getbcnerrcnt_parm getbcnerrcnt_rsp getcurtxpwrlevel_parm
getcurtxpwrlevel_rsp setprobereqextraie_parm setassocreqextraie_parm
setproberspextraie_parm setassocrspextraie_parm smooth_rssi_data
specific_device_id BSSIDInfo ndis_802_11_association_information
ndis_802_11_key ndis_802_11_remove_key iocmd_struct rf_reg_param
bb_reg_param wowlan_ioctl_param addba_event c2hevent_queue
phystatus_8723b sha256_state country_code_to_enum_rd reg_protocol_rd
reg_protocol_wt rtw_ieee80211_bar r_antenna_select_ofdm agg_pkt_info
ieee_ibss_seq ieee80211_rx_stats ieee80211_frag_entry ieee80211_stats
ieee80211_softmac_stats ieee80211_security ieee80211_header_data
phy_status_rpt_8812_t odm_sta_info_t odm_ra_info_t

Should I submit a patchset that removes all of these definitions?

Best regards,

Marco

---- 
Marco Cesati, PhD
Dept. of Civil Engineering and Computer Science Engineering
Univ. of Rome Tor Vergata
via del Politecnico 1, I-00133 Rome, Italy
Tel. +39 06 7259 7389
