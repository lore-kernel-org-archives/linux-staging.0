Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09902C80
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 10:45:26 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z20so55012561edc.13
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 03:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K46PU/CtevSIz6UOLXirJuDMgf7mx0ZTMbKdIpAc0wg=;
        b=EmSrTebprvFUzgekyD5eCrSNSztWMIjm8q2EKJhgeh5/l6rjpZF2k0cg7ZWhkHxvqu
         g8rQVOlFBvyDdTE8CBmCFqp0+E7lVIUhY/XVAsTHU+XUmHuI9UCCFUmCa21jwXgFRZLm
         t4h9DjSKWxWyCsOPCnNfy5UcPA9WqHWTwWnnQVRQbc2sSOGhbfufx0Uj1Xy3B/nKw1tx
         hIMhuUceoUAX1Z6U8Eqq0bL2XCDgnlC8XYbc5I3u2sh9gDRO5vg77Djr178I9E6FXyi6
         cSByHbatiKqrQIimIKQeswwqZQfXUElVQ4qqSOl2C3lVaKXUZ2/ciyYpygxF/e+S5IgM
         j6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K46PU/CtevSIz6UOLXirJuDMgf7mx0ZTMbKdIpAc0wg=;
        b=e4VjPoDDocOVfpllm+y+3dtdgdWxb5FSD0ur7vukTju7nLWw2eBw/gpmv2sFwxw12u
         Ij7e79CV991/gZShYiFyBFAPx49BgXZnxLkuBU1SXzZRnA8b3EPoo8YgZJh4OGqxPAlH
         5EEZttDgXdivrIMf+NXk9RnGbrSFom9sKqwQgk5qIrkjSz1UQAdLaNWNoYfZ+xJ2rAcQ
         D0oauPTSH8XDm47pWx5aBfr9MB43FSQgHAeWhj+PC3KxmQnqy4V5UYfZr5Np1VRm74nZ
         x129kv4fbaMp+1zU5HvQnxean6lIG6lgPrdEJlmRxiR0+gie6rbL4YeK6gR2fvnX8KjN
         47nw==
X-Gm-Message-State: AOAM532PgUj5FP+LP6AV3hZJsxih7quNHl+9NS7G7bTIbvc9dLu8Z2Iq
	mT/AeEBe+sKg21YF8FRfZwk=
X-Google-Smtp-Source: ABdhPJzHdIaOJ4ELl1ldbOo7M3rSrRyIGihnstctUXkwl2j5ZQ/DwAoLbJizm9vX9KxMwmFSv2hIKw==
X-Received: by 2002:aa7:c2da:: with SMTP id m26mr3306303edp.89.1633862725193;
        Sun, 10 Oct 2021 03:45:25 -0700 (PDT)
Received: from agape.jhs ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id h11sm1934657eji.96.2021.10.10.03.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 03:45:24 -0700 (PDT)
Date: Sun, 10 Oct 2021 12:45:21 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: hdegoede@redhat.com, linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: Add rtl8723bs sdio wifi driver
Message-ID: <YWLEQcxMY3sX1soJ@agape.jhs>
References: <20211005090646.GA18431@kili>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005090646.GA18431@kili>

Hi Dan,

thank you for your report,

On Tue, Oct 05, 2021 at 12:06:46PM +0300, Dan Carpenter wrote:
> Hello Hans de Goede,
> 
> The patch 554c0a3abf21: "staging: Add rtl8723bs sdio wifi driver"
> from Mar 29, 2017, leads to the following Smatch static checker
> warnings:
> 
>     drivers/staging/rtl8723bs/core/rtw_security.c:1404 rtw_BIP_verify()
>     warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)
> 
>     drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:4058 collect_bss_info()
>     warn: not copying enough bytes for '&le32_tmp' (4 vs 2 bytes)
> 
> drivers/staging/rtl8723bs/core/rtw_security.c
>     1372 u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
>     1373 {
>     1374         struct rx_pkt_attrib *pattrib = &((union recv_frame *)precvframe)->u.hdr.attrib;
>     1375         u8 *pframe;
>     1376         u8 *BIP_AAD, *p;
>     1377         u32 res = _FAIL;
>     1378         uint len, ori_len;
>     1379         struct ieee80211_hdr *pwlanhdr;
>     1380         u8 mic[16];
>     1381         struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>     1382         __le16 le_tmp;
>     1383         __le64 le_tmp64;
>                  ^^^^^^^^^^^^^^^
> 
>     1384 
>     1385         ori_len = pattrib->pkt_len-WLAN_HDR_A3_LEN+BIP_AAD_SIZE;
>     1386         BIP_AAD = rtw_zmalloc(ori_len);
>     1387 
>     1388         if (!BIP_AAD)
>     1389                 return _FAIL;
>     1390 
>     1391         /* PKT start */
>     1392         pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
>     1393         /* mapping to wlan header */
>     1394         pwlanhdr = (struct ieee80211_hdr *)pframe;
>     1395         /* save the frame body + MME */
>     1396         memcpy(BIP_AAD+BIP_AAD_SIZE, pframe+WLAN_HDR_A3_LEN, pattrib->pkt_len-WLAN_HDR_A3_LEN);
>     1397         /* find MME IE pointer */
>     1398         p = rtw_get_ie(BIP_AAD+BIP_AAD_SIZE, WLAN_EID_MMIE, &len, pattrib->pkt_len-WLAN_HDR_A3_LEN);
>     1399         /* Baron */
>     1400         if (p) {
>     1401                 u16 keyid = 0;
>     1402                 u64 temp_ipn = 0;
>     1403                 /* save packet number */
> --> 1404                 memcpy(&le_tmp64, p+4, 6);
>                                 ^^^^^^^^^^^^^^^^^
>     1405                 temp_ipn = le64_to_cpu(le_tmp64);
>                                                 ^^^^^^^^
> This code is copying 6 bytes into a u64 and then treating it as little
> endian data.  The problem is that the last two bytes are uninitialized
> garbage data.  I think if we set "__le64 le_tmp64 = 0;" at the top that
> would probably work, right?
> 
> I could have sent a patch but this code is weird enough that I was
> hoping for a second opinion.
> 
> The bug in collect_bss_info() is a similar uninitialized data issue.

You are right I think that it's safer to intitalize to zero
le_tmp64 and le32_tmp.

> 
>     1406                 /* BIP packet number should bigger than previous BIP packet */
>     1407                 if (temp_ipn <= pmlmeext->mgnt_80211w_IPN_rx)
>     1408                         goto BIP_exit;
>     1409 
>     1410                 /* copy key index */
>     1411                 memcpy(&le_tmp, p+2, 2);
> 
> But this part seems totally wrong again because we haven't incremented
> p.  p + 10?

I don't know what you mean. I guess that you are adressing the code above
(lines 1406-1411).

Anyway I think the code it's right. MMIE layout is:

	1 byte element_id;
	1 byte length;
	2 byte key_id;
	6 byte IPN;
	8 byte MIC;

so to access key_id I have to increment p by 2.

> 
>     1412                 keyid = le16_to_cpu(le_tmp);
>     1413                 if (keyid != padapter->securitypriv.dot11wBIPKeyid)
>     1414                         goto BIP_exit;
>     1415 
>     1416                 /* clear the MIC field of MME to zero */
>     1417                 memset(p+2+len-8, 0, 8);
>     1418 
>     1419                 /* conscruct AAD, copy frame control field */
>     1420                 memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
>     1421                 ClearRetry(BIP_AAD);
>     1422                 ClearPwrMgt(BIP_AAD);
>     1423                 ClearMData(BIP_AAD);
>     1424                 /* conscruct AAD, copy address 1 to address 3 */
>     1425                 memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
>     1426 
>     1427                 if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
>     1428                         , BIP_AAD, ori_len, mic))
>     1429                         goto BIP_exit;
>     1430 
>     1431                 /* MIC field should be last 8 bytes of packet (packet without FCS) */
>     1432                 if (!memcmp(mic, pframe+pattrib->pkt_len-8, 8)) {
>     1433                         pmlmeext->mgnt_80211w_IPN_rx = temp_ipn;
>     1434                         res = _SUCCESS;
>     1435                 } else {
>     1436                 }
>     1437 
>     1438         } else {
>     1439                 res = RTW_RX_HANDLED;
>     1440         }
>     1441 BIP_exit:
>     1442 
>     1443         kfree(BIP_AAD);
>     1444         return res;
>     1445 }
> 
> regards,
> dan carpenter
> 

thank you,

fabio
