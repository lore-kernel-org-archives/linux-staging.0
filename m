Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EDA7C;
	Sun,  3 Apr 2022 19:17:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n19-20020a9d7113000000b005cd9cff76c3so5914598otj.1;
        Sun, 03 Apr 2022 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ehcFmg+Mkg9BnKgNhNCCaDn3+8UpDGuCPAmWgTV0xw=;
        b=YKTq66ofeUUwKoqp5vOZiShoH+aW48zisWmikLKh+2/pNnuy+Sq3L5f1JfYnmq+rND
         YikeRuZquyRGJb55UpvV8eB2GWRvSKBpPfc4JAWJctpfN4Kv5tou9Y8Gz7i8PwQ5SKHP
         R4tfxSyasVtG80BeJCjd4qryX2ZIS79aZDOPDKsUUAEagXD95AkzWX+Jjij2mZikYHQN
         pHJcRPeisrDgoY5Tlwq0zxCMLhroapa0bzZt0c/7Qr6unzXe3PyqcT8cr92ROYyFzpnE
         gIsZbGPyZj99+8GHK7/DFDOR5cAryDy6avc/49z0c0dry6oh00xshkW0/0gBpwAaj0wM
         ZGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ehcFmg+Mkg9BnKgNhNCCaDn3+8UpDGuCPAmWgTV0xw=;
        b=dx5T8/QZ/FJgbt5KGvOAkj4fOBiMYSSfQrTAo2Wd7EQnpfu+PsayNGyqCPFOggqWPK
         Ef5yggQWabP74/Kg2zOdHdVdw3B36eeXw2W62bTrFhwRkeAjjLFgFxhIXiqSTxiICIYu
         P5D5/TopDtDOzTl2vbMZEr6ndTlaca90zCPTDEewMZJzAlP+2bUv2jRfGqHomyy+jIqS
         aaMySn8HZCxfNfkBfG69Gup8xwAaZ+a8vHgoe3tBGaZ3dip5LkgcZ6qL9yASeRNnvYS6
         matsxCICAOrQ+DucN7wVkqEHD1BbWCDwoTpQ+8eUkyWXM+DZbi3vEgPspcxbOpLLlAyW
         7MUA==
X-Gm-Message-State: AOAM532DjUXgaysUP5oAMBAxWBMGymO6q5l3FmiwwsqtUgOi1xqTYnl1
	0CkPr+WpAJV3/J0bE+ApYcs=
X-Google-Smtp-Source: ABdhPJw341HdbepkpPDc7e7UxbgjrgppKpNGL8k43XY3kuFhgG+2GIpXxIszbSIiJu7No+boSil2mA==
X-Received: by 2002:a05:6830:1e8d:b0:5cf:b0e6:82ed with SMTP id n13-20020a0568301e8d00b005cfb0e682edmr4231382otr.177.1649013432655;
        Sun, 03 Apr 2022 12:17:12 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id m23-20020a4add17000000b0032489ab619esm3208837oou.45.2022.04.03.12.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:17:12 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up two *_cmd_callback() functions in rtw_cmd.c
Date: Sun,  3 Apr 2022 14:17:03 -0500
Message-Id: <cover.1649011311.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches perform cleanup in/around functions 
rtw_survey_cmd_callback() and rtw_joinbss_cmd_callback().

Rebecca Mckeever (3):
  staging: r8188eu: remove handlerOS independent comment
  staging: r8188eu: combine both sides of conditional statement
  staging: r8188eu: add blank line between functions

 drivers/staging/r8188eu/core/rtw_cmd.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.32.0

